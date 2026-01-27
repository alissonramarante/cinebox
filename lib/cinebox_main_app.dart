import 'package:cinebox_app/ui/core/themes/theme.dart';
import 'package:cinebox_app/ui/home/home_screen.dart';
import 'package:cinebox_app/ui/login/login_screen.dart';
import 'package:cinebox_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

class CineboxMainApp extends StatelessWidget {

  const CineboxMainApp({ super.key });

   @override
   Widget build(BuildContext context) {
       return MaterialApp(
        title: 'Cinebox',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        navigatorKey: navKey,
        routes: {
          '/': (_) => SplashScreen(),
          '/login': (_) => LoginScreen(),
          '/home': (_) => const HomeScreen(),
        },
       );
  }
}