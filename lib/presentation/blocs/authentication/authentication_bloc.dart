import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pes/providers/local/shared_prefs.dart';
import 'package:pes/repository/auth_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthenRepository _authenticationRepository;

  AuthenticationBloc(IAuthenRepository authenticationService)
      : _authenticationRepository = authenticationService,
        super(AuthenticationInitial()) {
    on<AppLoaded>((event, emit) async {
      emit(AuthenticationLoading());
      final currentUser = await _authenticationRepository.getCurrentUser();
      if (SharedPrefs.instance.isLogined && currentUser != null) {
        emit(AuthenticationAuthenticated(user: currentUser));
      } else {
        emit(AuthenticationNotAuthenticated());
      }
    });

    on<UserLoggedIn>((event, emit) {
      SharedPrefs.instance.user = event.user;
      SharedPrefs.instance.isLogined = true;
      emit(AuthenticationAuthenticated(user: event.user));
    });

    on<UserLoggedOut>((event, emit) async {
      await _authenticationRepository.signOut();
      emit(AuthenticationNotAuthenticated());
    });
  }
}
