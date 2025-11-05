import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';

class GradientText extends StatelessWidget {
  const GradientText({required this.text, this.colors, super.key});

  final String text;
  final List<Color>? colors;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: colors ?? [Color(0xFFFBB03B), Color(0xFFEC0C43)],
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: context.isMobile
              ? 24
              : context.isDesktop
              ? 50
              : 45,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
