import 'package:go_router/go_router.dart';
import 'package:task11/componaned/navigator_bar.dart';
import 'package:task11/screens/logIn_view.dart';
import 'package:task11/screens/on_boarding_view.dart';
import 'package:task11/screens/register_view.dart';


abstract class AppRouter {
  static const kRegister = '/register';
  static const kLogin = '/login';
  static const kHomeView = '/homeView';





  static final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const OnBoardingView()
        ),
        GoRoute(
            path:kLogin,
            builder: (context, state) =>  const LogInView()
        ),
        GoRoute(
            path:kRegister,
            builder: (context, state) =>  const RegisterView()
        ),
        GoRoute(
            path:kHomeView,
            builder: (context, state) =>  const HomeView()
        ),



      ]);
}