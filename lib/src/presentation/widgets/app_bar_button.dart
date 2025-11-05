import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    required this.isActive,
    required this.name,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final bool isActive;
  final String name;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? Color(0xFFF5F5F5) : null,
          border: isActive
              ? Border.all(color: Color(0xFFDFDFDF), width: 1)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Image.asset(
              icon,
              height: 17,
              color: isActive ? Colors.black : Colors.grey.shade400,
            ),
            Text(
              name,
              style: TextStyle(
                color: isActive ? Colors.black : Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
