import 'package:daftra/presentation/features/auth/auth_bloc/auth_bloc.dart';
import 'package:daftra/presentation/resources/app_images.dart';
import 'package:daftra/presentation/widgets/custom_bottom_sheet.dart';
import 'package:daftra/presentation/widgets/overlay_loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/login_card_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";

  LoginScreen({super.key});

  final loading = LoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: _listenToAuthBloc,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildLogo(context),
              LoginCardWidget(),
            ],
          )),
    );
  }

  _buildLogo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SvgPicture.asset(AppImages.logo),
    );
  }

  void _listenToAuthBloc(BuildContext context, AuthState state) {
    if (state is AuthLoading) {
      loading.show(context);
    } else if (state is AuthLoginSuccess) {
      loading.hide();
      _createBottomSheet(
          context,
          AppLocalizations.of(context)!.login_successful,
          AppLocalizations.of(context)!.login_data(
              state.user.email, state.user.password, state.user.loginTimes),
          SheetType.success);
    } else if (state is AuthLoginFailure) {
      loading.hide();
      _createBottomSheet(
          context,
          AppLocalizations.of(context)!.incorrect_password,
          AppLocalizations.of(context)!.email_and_password_msg,
          SheetType.error);
    } else {
      loading.hide();
    }
  }

  _createBottomSheet(
      BuildContext context, String title, String description, SheetType type) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return CustomBottomSheet(
          title: title,
          description: description,
          type: type,
        );
      },
    );
  }
}
