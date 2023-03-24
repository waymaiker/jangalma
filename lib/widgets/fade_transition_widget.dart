import 'package:flutter/material.dart';

class FadeTransitionWidget extends StatefulWidget {
  final Widget child;
  final bool fadeInFadeOut;
  final bool blinking;

  const FadeTransitionWidget({
    required this.child,
    this.blinking = false,
    this.fadeInFadeOut = true,
  });

  @override
  _FadeTransitionStateWidget createState() => _FadeTransitionStateWidget();
}

class _FadeTransitionStateWidget extends State<FadeTransitionWidget>  with TickerProviderStateMixin{
  late AnimationController animation;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();

    if(widget.blinking) {
      animation = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200)
      )..repeat();
    } else {
      animation = AnimationController(
        vsync: this, 
        duration: const Duration(milliseconds: 200)
      );
    }

    _fade = widget.fadeInFadeOut
      ? Tween<double>(begin: 0.0, end: 1.0).animate(animation)
      : Tween<double>(begin: 1.0, end: 0.0).animate(animation);

    animation.forward();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: widget.child
    );
  }
}