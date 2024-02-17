import 'package:go_router/go_router.dart';
import 'package:widgetsapp/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: HomeScreen.name,
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    name: ButtonsScreen.name,
    path: '/buttons',
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    name: CardsScreen.name,
    path: '/cards',
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    name: ProgressScreen.name,
    path: '/progress',
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    name: SnackBarScreen.name,
    path: '/snackbar',
    builder: (context, state) => const SnackBarScreen(),
  ),
  GoRoute(
    name: AnimatedScreen.name,
    path: '/animated',
    builder: (context, state) => const AnimatedScreen(),
  ),
  GoRoute(
    name: UIControlsScreen.name,
    path: '/ui_controls',
    builder: (context, state) => const UIControlsScreen(),
  ),
  GoRoute(
    name: AppTutorialScreen.name,
    path: '/app_tutorial',
    builder: (context, state) => const AppTutorialScreen(),
  )
]);
