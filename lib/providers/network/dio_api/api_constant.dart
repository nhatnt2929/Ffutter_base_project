enum Enviroment { dev, stag, prod }

class EnviromentConfig {
  static get env => Enviroment.dev;
}

class ApiConstants {
  static get baseURL => ApiConstants.baseUrl;

  static const refreshToken = '/refreshToken';
  static const checkUserExist = '/checkUserExist';
  static const login = '/v1/login';

  static const url_stag = '';
  static const url_dev = '';
  static const url_prod = '';

  static get baseUrl {
    switch (EnviromentConfig.env) {
      case Enviroment.dev:
        return ApiConstants.url_dev;
      case Enviroment.stag:
        return ApiConstants.url_stag;
      case Enviroment.prod:
        return ApiConstants.url_prod;
      default:
        return ApiConstants.url_prod;
    }
  }
}
