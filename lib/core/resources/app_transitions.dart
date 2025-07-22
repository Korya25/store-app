import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTransitions {
  static Page<T> fade<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }

  static Page<T> slideFromRight<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
    );
  }

  static Page<T> scale<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          ),
    );
  }

  static Page<T> rotation<T>(Widget child) {
    return CustomTransitionPage<T>(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          RotationTransition(
            turns: Tween<double>(begin: 0.9, end: 1.0).animate(animation),
            child: child,
          ),
    );
  }
}
