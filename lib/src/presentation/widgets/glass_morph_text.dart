import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphText extends StatelessWidget {
  const GlassMorphText({
    required this.noOfWallpaper,
    this.textColor,
    super.key,
  });

  final int noOfWallpaper;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF878787).withValues(alpha: 0.1),
                Color(0xFF878787).withValues(alpha: 0.15),
              ],
            ),
            border: Border.all(width: 1, color: Colors.white),
          ),
          child: Text(
            '$noOfWallpaper wallpapers',
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
