import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/core/configs/theme/app_theme.dart';
import 'package:shop_app/firebase_options.dart';
import 'package:shop_app/presentation/choose_mode/bloc/theme_bloc.dart';
import 'package:shop_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:shop_app/presentation/splash/pages/splash_page.dart';
import 'package:shop_app/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  await initializeDependencies();
  runApp(
    MyApp(prefs: prefs),
  );
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(prefs),
        ),
        BlocProvider(
          create: (context) => SplashCubit()..appStarted(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final themeMode = context.watch<ThemeBloc>().state.themeMode;
          return MaterialApp(
            theme: AppTheme.lightTheme,
            // Light theme
            darkTheme: AppTheme.darkTheme,
            // Dark theme
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
          );
        },
      ),
    );
  }
}
