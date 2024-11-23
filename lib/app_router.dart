import 'package:flutter_task/view/authentication/login/login_view.dart';
import 'package:flutter_task/view/authentication/sign_up/sign_up_view.dart';
import 'package:flutter_task/view/feed/feed_view.dart';
import 'package:flutter_task/view/profile/profile_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/sign_up',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: '/feed',
      builder: (context, state) => const FeedView(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileView(),
    ),
  ],
);
