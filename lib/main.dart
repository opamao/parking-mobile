import 'package:flutter/material.dart';
import 'package:parkingflutter/presentation/auth/login_screen.dart';
import 'package:parkingflutter/presentation/auth/register_screen.dart';
import 'package:parkingflutter/presentation/historique/ticket_screen.dart';
import 'package:parkingflutter/presentation/home_screen.dart';
import 'package:parkingflutter/presentation/parking/attribution_screen.dart';
import 'package:parkingflutter/presentation/parking/emplacement_screen.dart';
import 'package:parkingflutter/presentation/parking/niveau_screen.dart';
import 'package:parkingflutter/presentation/parking/recu_screen.dart';
import 'package:parkingflutter/presentation/splash_screen.dart';
import 'package:parkingflutter/utils/page_not_found.dart';
import 'package:parkingflutter/utils/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime.shade500),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.niveau:
        return MaterialPageRoute(
          builder: (context) => const NiveauScreen(),
        );
      case Routes.emplacement:
        return MaterialPageRoute(
          builder: (context) => const EmplacementScreen(),
        );
      case Routes.attribution:
        return MaterialPageRoute(
          builder: (context) => const AttributionScreen(),
        );
      case Routes.recu:
        return MaterialPageRoute(
          builder: (context) => const RecuScreen(),
        );
      case Routes.ticket:
        return MaterialPageRoute(
          builder: (context) => const TicketScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFoundScreen(),
        );
    }
  }
}