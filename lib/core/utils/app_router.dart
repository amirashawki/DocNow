import 'package:docnow_app/Features/auth/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(path:'/', builder: (context, state) {
      return LoginView();
    }),
  ]);
}
