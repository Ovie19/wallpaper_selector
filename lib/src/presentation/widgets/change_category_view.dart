import 'package:flutter/material.dart';

class ChangeCategoryViewButton extends StatelessWidget {
  const ChangeCategoryViewButton({
    required this.isActive,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final bool isActive;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isActive
            ? Color(0xFFFFA821).withValues(alpha: 0.2)
            : Colors.transparent,
        padding: EdgeInsets.all(4),
        child: Image.asset(
          icon,
          height: 18,
          color: isActive ? Color(0xFFFFA821) : Colors.grey,
        ),
      ),
    );
  }
}