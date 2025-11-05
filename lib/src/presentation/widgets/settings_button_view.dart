import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';

class SettingsButtonView extends StatelessWidget {
  const SettingsButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) {
      return Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingsButton(name: 'Cancel'),
          SettingsButton(name: 'Save Settings', isGrey: false),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 20,
      children: [
        SettingsButton(name: 'Cancel'),
        SettingsButton(name: 'Save Settings', isGrey: false),
      ],
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, required this.name, this.isGrey = true});

  final String name;
  final bool isGrey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isGrey ? Color(0xFFF5F5F5) : Color(0xFFFBB03B),
          border: isGrey
              ? Border.all(color: Color(0xFFDFDFDF), width: 1)
              : null,
        ),
        child: Text(
          name,
          style: TextStyle(
            color: isGrey ? Colors.black : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
