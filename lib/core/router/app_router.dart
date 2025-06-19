import 'package:go_router/go_router.dart';
import 'package:myapp/presentation/screens/add_card.dart';
import 'package:myapp/presentation/screens/home_screen.dart';
import 'package:myapp/presentation/screens/login_screen.dart';
import 'package:myapp/presentation/screens/card_detail.dart';
import 'package:myapp/presentation/screens/edit_card.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),

    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
  
    GoRoute(path: '/CardDetail', builder: (context, state) => CardDetail()),

    GoRoute(path: '/AddCard', builder: (context, state) => AddCard()),

    GoRoute(path: '/EditCard', builder: (context, state) => EditCard()),
    
  ], );