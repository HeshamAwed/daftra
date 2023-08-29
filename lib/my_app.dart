import 'package:daftra/presentation/features/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'presentation/resources/themes.dart';
import 'utils/app_state.dart';
import 'utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppState.mainAppKey,
      title: 'Daftra',
      routes: appRoutes,
      home:  LoginScreen(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<AppState>().locale,
      theme: MaterialThemeData.themeData,
    );
  }

}
