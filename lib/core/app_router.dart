import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

import '../views/about_view.dart';
import '../views/home_view.dart';


class AppRouter{

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const HomeView()),
      // GoRoute(path: "/about", builder: (context, state) => const AboutView()),
      //----------------------------------------------------------
      
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) {
          return _buildPageWithTransition(
            state,
            const AboutView(),
          );
        },
      ),
    ]
  );

  static Page _buildPageWithTransition(GoRouterState state, Widget child) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return PageTransition(
          type: PageTransitionType.leftToRight, // نوع الانتقال
          child: child,
          duration: const Duration(milliseconds: 600), // مدة الانتقال
          reverseDuration: const Duration(milliseconds: 600),
          alignment: Alignment.center,
          childCurrent: child,
        ).buildTransitions(context, animation, secondaryAnimation, child);
      },
    );
  }
}

