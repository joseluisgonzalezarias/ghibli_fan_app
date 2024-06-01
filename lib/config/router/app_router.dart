import 'package:ghibli_fan_app/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: 'home_screen',
    //add builder pointing to home
    builder: (context, state) => const HomeScreen(),
  ),
]);
