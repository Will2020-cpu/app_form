import 'package:app_form/screens/home_screen.dart';
import 'package:app_form/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/login',

  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/login', builder: ((context, state) => const LoginScreen())),
  ],
);
