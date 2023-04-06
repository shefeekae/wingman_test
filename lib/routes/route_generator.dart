import 'package:flutter/material.dart';
import 'package:wingman_test/auth/auth.dart';
import 'package:wingman_test/view/home_screen.dart';
import 'package:wingman_test/view/login_screen.dart';
import 'package:wingman_test/view/otp_screen.dart';
import 'package:wingman_test/view/user_info_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const AuthPage(),
        );

      case '/home':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );

      case '/userInfo':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              UserInfoScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );

      // case '/homeOrUserInfo':
      //   return PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         const HomeOrUserInfo(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      //       final offsetAnimation = animation.drive(tween);
      //       return SlideTransition(
      //         position: offsetAnimation,
      //         child: child,
      //       );
      //     },
      //   );

      case '/otp':
        if (args is Map<String, dynamic>) {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => OtpScreen(
              requestId: args['requestId'],
              number: args['number'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          );
        }
        return _errorRoute();
      case '/login':
        // if (args is String) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final tween =
                Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
      // }
      // return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Error')),
          body: const Center(
            child: Text('There is Some error in the routing'),
          ),
        );
      },
    );
  }
}
