import 'package:injectable/injectable.dart';
import 'package:pes/providers/network/apis/base/application_dio.dart';
import 'package:pes/providers/network/apis/base/base_api.dart';

@injectable
class HomeAPI extends BaseApi {
  HomeAPI() : super(ApplicationDio().getDioClientEX());
}
