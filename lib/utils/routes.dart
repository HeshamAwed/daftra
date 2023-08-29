import 'package:daftra/presentation/features/auth/login/login_screen.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

Map<String, WidgetBuilder> appRoutes = {
  LoginScreen.routeName: (context) => LoginScreen()
};
