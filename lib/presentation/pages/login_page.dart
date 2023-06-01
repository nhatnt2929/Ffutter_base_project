import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pes/common/localization.dart';
import 'package:pes/config/app_colors.dart';
import 'package:pes/config/app_images.dart';
import 'package:pes/config/app_text_styles.dart';
import 'package:pes/config/icon.dart';
import 'package:pes/di/app_injector.dart';
import 'package:pes/helper/loading_helper.dart';
import 'package:pes/presentation/blocs/authentication/authentication.dart';
import 'package:pes/presentation/blocs/login/login.dart';
import 'package:pes/presentation/common/base_button.dart';
import 'package:pes/presentation/common/customize_dialog.dart';
import 'package:pes/presentation/common/size.dart';
import 'package:pes/providers/local/shared_prefs.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: const LoginForm(),
      ),
    );
  }
}

enum TypeBio { face, touch, weak, strong, none }

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc get _loginBloc => BlocProvider.of<LoginBloc>(context);
  bool isFocusEmailInput = false;
  bool isFocusPassInput = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(
      FocusNode(),
    );
  }

  void _inputOnChanged() {
    _loginBloc.add(
      LoginChangedEvent(
          email: _emailController.text, password: _passwordController.text),
    );
  }

  _onLoginButtonPressed() async {
    if (_loginBloc.state.isValidForm) {
      _loginBloc.add(
          LoginSignInButton(_emailController.text, _passwordController.text));
      _dismissKeyboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    void _showError(String error) {
      CustomizeDialog.errorDialog(
        titleStyle: AppTextStyle.bold28White,
        messageStyle: AppTextStyle.normal20White,
        context: context,
        message: error,
        onPressedOk: (context) {
          Navigator.of(context, rootNavigator: true).pop();
          _inputOnChanged();
        },
      );
    }

    return WillPopScope(
      onWillPop: () async {
        return !(Navigator.of(context).userGestureInProgress);
      },
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginStateLoading) {
              LoadingHelper.showLoading();
            } else {
              LoadingHelper.hiddenLoading();
              if (state is LoginStateError) {
                _showError(state.error);
              }
              if (state is LoginStateSuccess) {
                _dismissKeyboard();
                _emailController.value = TextEditingValue.empty;
                _passwordController.value = TextEditingValue.empty;
                final authBloc = BlocProvider.of<AuthenticationBloc>(context);
                authBloc.add(UserLoggedIn(user: state.model));
              }
            }
          },
          builder: (context, state) {
            return _buildBody(context);
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    var _localSize = SizeApp(context);

    return GestureDetector(
      onTap: () => _dismissKeyboard(),
      child: Container(
        color: AppColors.mainWhite,
        child: _buildContent(_localSize, context),
      ),
    );
  }

  Widget _buildContent(SizeApp _localSize, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildList(_localSize),
        ),
      ],
    );
  }

  Widget _buildList(SizeApp _localSize) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: <Widget>[
          SizedBox(height: _localSize.getScreenHeight() * 0.0588),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildTitle(_localSize),
          ),
          const SizedBox(height: 8),
          Container(
            height: 24,
            width: 147,
            margin: const EdgeInsets.only(top: 8, bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Username', style: AppTextStyle.normal15Blue),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildInput(
              false,
              'Email/Username',
              Localization.localized(context).login_id_invalid,
              _loginBloc.state.isValidEmail,
              _emailController,
              AppImages.usernameIcon,
            ),
          ),
          Container(
            height: 24,
            width: 147,
            margin: const EdgeInsets.only(top: 5, bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Password', style: AppTextStyle.normal15Blue),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildInput(
              true,
              'Password',
              Localization.localized(context).api_key_invalid,
              _loginBloc.state.isValidPassword,
              _passwordController,
              AppImages.passwordIcon,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buttonLogin(),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(SizeApp _localSize) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(top: 0.0757 * _localSize.getScreenHeight()),
      alignment: Alignment.center,
      child: AutoSizeText(
        'FARM MANAGEMENT',
        style: AppTextStyle.bold30Blue,
        minFontSize: 20,
        stepGranularity: 10,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  bool isShowPassword = false;

  Widget _buildInput(bool isPassword, String placeholder, String invalidMessage,
      bool isValid, TextEditingController controller, String icon) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 48,
        child: Stack(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: placeholder,
                contentPadding: const EdgeInsets.only(
                  top: 12.0,
                  left: 12,
                  right: 32,
                ),
              ),
              keyboardType:
                  isPassword ? TextInputType.text : TextInputType.emailAddress,
              cursorHeight: 15,
              obscureText: (isPassword && !isShowPassword),
              style: AppTextStyle.normal15Black,
              controller: controller,
              onChanged: (_) => _inputOnChanged(),
            ),
            GestureDetector(
              onTap: () {
                isShowPassword = !isShowPassword;
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: isPassword
                    ? IconConstants.loadImageSvg(
                        (isShowPassword
                            ? AppImages.eyeClose
                            : AppImages.eyeOpen),
                        width: 14.0,
                        height: 14.0,
                      )
                    : IconConstants.loadImageSvg(
                        icon,
                        width: 17.0,
                        height: 24.0,
                      ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.zero,
            child: Opacity(
              opacity: _loginBloc.state.isValidForm ? 1.0 : 0.5,
              child: BaseButton(
                style: AppTextStyle.normal15White,
                height: 50,
                text: 'Login',
                onPressed: () => _onLoginButtonPressed(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
