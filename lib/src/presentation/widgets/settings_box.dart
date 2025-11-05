import 'package:flutter/material.dart';

class SettingsBox extends StatelessWidget {
  final String title;
  final List<DropdownMenuEntry<String>> options;

  const SettingsBox({super.key, required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E5E5), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8),
          DropdownMenu<String>(
            width: double.infinity,
            initialSelection: options.first.value,
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE5E5E5), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE5E5E5), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE5E5E5), width: 1),
              ),
            ),
            textStyle: TextStyle(
              fontSize: 14,
              color: Color(0xFF9C9C9C),
              fontWeight: FontWeight.w400,
            ),
            dropdownMenuEntries: options,
            menuStyle: MenuStyle(
              maximumSize: WidgetStateProperty.all(
                const Size(400, double.infinity),
              ),
              minimumSize: WidgetStateProperty.all(const Size(300, 0)),
            ),
            onSelected: (value) {},
          ),
        ],
      ),
    );
  }
}
