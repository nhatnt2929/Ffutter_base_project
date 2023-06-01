// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/usecases/home_usecase.dart' as _i21;
import '../domain/usecases/login_usecase.dart' as _i15;
import '../presentation/blocs/authentication/authentication_bloc.dart' as _i19;
import '../presentation/blocs/login/login_bloc.dart' as _i4;
import '../providers/network/apis/auth_api.dart' as _i3;
import '../providers/network/apis/base/base_config.dart' as _i6;
import '../providers/network/apis/home_api.dart' as _i8;
import '../providers/network/models/mapper/login_data_mapper.dart' as _i10;

import '../repository/auth_repository.dart' as _i14;
import '../repository/home_repository.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthAPI>(() => _i3.AuthAPI());
  gh.factory<_i4.BaseBloc>(() => _i4.BaseBloc());
  gh.factory<_i6.Configs>(() => _i6.Configs());
  gh.factory<_i8.HomeAPI>(() => _i8.HomeAPI());
  gh.factory<_i10.LoginDataMapper>(() => _i10.LoginDataMapper());

  gh.factory<_i14.IAuthenRepository>(() => _i14.AuthenRepository(
        loginDataMapper: get<_i10.LoginDataMapper>(),
        authAPI: get<_i3.AuthAPI>(),
      ));
  gh.factory<_i15.ILoginUseCase>(
      () => _i15.LoginUseCase(get<_i14.IAuthenRepository>()));

  gh.factory<_i19.AuthenticationBloc>(
      () => _i19.AuthenticationBloc(get<_i14.IAuthenRepository>()));
  gh.factory<_i20.IHomeRepository>(() => _i20.HomeRepository());
  gh.factory<_i21.IHomeUseCase>(
      () => _i21.HomeUseCase(get<_i20.IHomeRepository>()));
  gh.factory<_i4.LoginBloc>(() => _i4.LoginBloc(
        get<_i15.ILoginUseCase>(),
        get<_i21.IHomeUseCase>(),
      ));

  return get;
}
