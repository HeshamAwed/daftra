import 'package:daftra/di/dependency_init.dart';
import 'package:daftra/presentation/features/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../utils/app_state.dart';

class GlobalAppProviders extends StatelessWidget {
  final Widget child;

  const GlobalAppProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppState(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => getIt<AuthBloc>(),
          ),
        ],
        child: child,
      ),
    );
  }
}
