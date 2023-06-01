import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app_injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => $initGetIt(getIt);

class AppInjector {
  static void setup() async {}

  static void injectDependencies() async {
    await configureDependencies();
  }
}
