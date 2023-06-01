// ignore_for_file: unnecessary_null_comparison
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pes/domain/usecases/home_usecase.dart';
import 'package:pes/domain/usecases/login_usecase.dart';
import 'package:pes/providers/model/user_model.dart';
import 'package:pes/repository/dio_api/network_exceptions.dart';
import 'login_event.dart';
import 'login_state.dart';

class BaseBloc {}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginUseCase _loginUseCase;
  final IHomeUseCase _homeUseCase;
  LoginBloc(this._loginUseCase, this._homeUseCase) : super(LoginInitial()) {
    on<LoginChangedEvent>((event, emit) {
      emit(LoginChangedState(email: event.email, password: event.password));
    });

    on<LoginSignInButton>((event, emit) async {
      User? user;
      emit(LoginStateLoading());

      final loginResult = await _loginUseCase.callLoginWithEmailPassword(
          event.email, event.password);
      loginResult.when(
        success: (user) async {
          emit(LoginStateSuccess(user));
          emit(LoginInitial());
        },
        failure: (NetworkExceptions e) {
          final errorMessage = NetworkExceptions.getErrorMessage(e);
          emit(LoginStateError(errorMessage));
        },
      );
    });
  }
}
