import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:pes/common/localization.dart';
import 'package:pes/config/app_colors.dart';
import 'package:pes/di/app_injector.dart';
import 'package:pes/helper/loading_helper.dart';
import 'package:pes/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:pes/presentation/blocs/authentication/authentication_event.dart';
import 'package:pes/presentation/widgets/decorate_input_border.dart';
import 'package:pes/providers/local/shared_prefs.dart';
import 'package:pes/routes/routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lifecycle/lifecycle.dart';

void main() async {
  await loadInitsInstanceApp();
  runApp(
    BlocProvider(
      create: (_) => getIt<AuthenticationBloc>()..add(AppLoaded()),
      child: const NTApp(),
    ),
  );
}

Future<void> loadInitsInstanceApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.instance.setup();
  SharedPrefs.instance.deviceId =
      await SharedPrefs.instance.getUniqueDeviceId();
  _setUpRotation();
  _setUpStatusBar();
  AppInjector.injectDependencies();
  LoadingHelper.configLoading();
}

void _setUpRotation() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _setUpStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class NTApp extends StatelessWidget {
  const NTApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: LoadingHelper.initLoading(),
      navigatorObservers: [defaultLifecycleObserver],
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: DecoratedInputBorder(
            child: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            shadow: BoxShadow(
              color: AppColors.vhMainGray,
              blurRadius: 12,
            ),
          ),
        ),
      ),
      routes: AppRouter.routes,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        Localization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      supportedLocales: Localization.supportedLocales,
    );
  }
}
