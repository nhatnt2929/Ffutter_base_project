import 'package:injectable/injectable.dart';
import 'package:pes/repository/home_repository.dart';

abstract class IHomeUseCase {}

@Injectable(as: IHomeUseCase)
class HomeUseCase extends IHomeUseCase {
  final IHomeRepository _homeRepo;
  HomeUseCase(this._homeRepo);
}
