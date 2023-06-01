import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pes/config/app_colors.dart';
import 'package:pes/config/icon.dart';
import 'package:pes/presentation/blocs/authentication/authentication_bloc.dart';
import 'package:pes/presentation/blocs/authentication/authentication_state.dart';
import 'package:pes/presentation/pages/login_page.dart';
import 'package:pes/presentation/pages/tabar_page.dart';

class PlashPage extends StatefulWidget {
  const PlashPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PlashState();
}

class _PlashState extends State<PlashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationLoading) {
            return Center(
              child: IconConstants.logoIcon(size: 150.0),
            );
          } else if (state is AuthenticationAuthenticated) {
            return Tabbar();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
