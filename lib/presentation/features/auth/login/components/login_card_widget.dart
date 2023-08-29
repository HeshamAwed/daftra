import 'package:daftra/presentation/features/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/default_text_field.dart';
import '../../../../widgets/rounded_button.dart';

class LoginCardWidget extends StatelessWidget {
  LoginCardWidget({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      margin: const EdgeInsets.all(20),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildTextTitle(context),
            const SizedBox(
              height: 20,
            ),
            DefaultTextField(
              controller: emailController,
              type: TextInputType.emailAddress,
              isPassword: false,
              hint: AppLocalizations.of(context)!.email,
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultTextField(
              controller: passwordController,
              type: TextInputType.visiblePassword,
              isPassword: true,
              hint: AppLocalizations.of(context)!.password,
            ),
            const SizedBox(
              height: 5,
            ),
            _buildForgetPasswordButton(context),
            const SizedBox(
              height: 10,
            ),
            RoundedButton(
              text: AppLocalizations.of(context)!.login,
              press: () {
                final email = emailController.text.toString();
                final password = passwordController.text.toString();
                context.read<AuthBloc>().add(LoginEvent(email, password));
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildTextTitle(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        AppLocalizations.of(context)!.welcome,
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _buildForgetPasswordButton(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {},
        child: Text(
          AppLocalizations.of(context)!.forget_password,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
