import 'package:injectable/injectable.dart';

abstract class IHomeRepository {}

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  HomeRepository();
}
