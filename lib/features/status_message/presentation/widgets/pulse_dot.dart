import 'package:flutter/material.dart';

class PulseDot extends StatefulWidget {
  final Color _color;
  final double _dotRadius;

  const PulseDot({super.key, required Color color, required double dotRadius})
    : _color = color,
      _dotRadius = dotRadius;

  @override
  State<PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<PulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation =
        Tween<double>(
          begin: widget._dotRadius * 2,
          end: widget._dotRadius * 4,
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,

      child: Center(
        child: CircleAvatar(
          radius: widget._dotRadius,
          backgroundColor: widget._color,
        ),
      ),

      builder: (context, child) {
        final size = _animation.value;

        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.transparent, Colors.transparent, widget._color],
              stops: const [0.5, 0.5, 1.0],
            ),
            shape: BoxShape.circle,
          ),
          child: child,
        );
      },
    );
  }
}
