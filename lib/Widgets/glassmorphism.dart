import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;
  final Color? color;

  const GlassMorphism({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              color: color ?? Colors.green.withOpacity(opacity),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: child,
          ),
        ));
  }
}
