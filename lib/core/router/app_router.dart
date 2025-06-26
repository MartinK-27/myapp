import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/screens/home_screen.dart';
import 'package:myapp/presentation/screens/login_screen.dart';
import 'package:myapp/presentation/screens/card_dae.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),

    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),

    GoRoute(path: '/CardDae', builder: (context, state) => CardDae()),
  ],
);
