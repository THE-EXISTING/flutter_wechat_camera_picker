///
/// [Author] Alex (https://github.com/AlexV525)
/// [Date] 2020/7/15 21:44
///
import 'package:flutter/material.dart';

/// Built a slide page transition for the picker.
/// 为选择器构造一个上下进出的页面过渡动画
class SlidePageTransitionBuilder<T> extends PageRoute<T> {
  SlidePageTransitionBuilder({
    required this.builder,
    this.transitionCurve = Curves.easeInOutQuint,
    this.transitionDuration = const Duration(milliseconds: 500),
  });

  final Widget builder;

  final Curve transitionCurve;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque = true;

  @override
  final bool barrierDismissible = false;

  @override
  final bool maintainState = true;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder;
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(curve: transitionCurve, parent: animation),
      ),
      child: child,
    );
  }
}
