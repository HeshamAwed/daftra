import 'package:flutter/material.dart';

import 'application/global_app_providers.dart';
import 'di/dependency_init.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    const GlobalAppProviders(
      child: MyApp(),
    ),
  );
}
