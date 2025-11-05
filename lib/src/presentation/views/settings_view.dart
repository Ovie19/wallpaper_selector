import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/constants/app_images.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';
import 'package:wallpaper_selector/src/presentation/widgets/gradient_text.dart';
import 'package:wallpaper_selector/src/presentation/widgets/settings_box.dart';
import 'package:wallpaper_selector/src/presentation/widgets/settings_button_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool horizontal = context.isDesktop;
    final MainAxisAlignment mainAxis = context.isMobile
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceEvenly;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.isDesktop ? 48 : 24,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: context.isDesktop ? context.width * 0.3 : 20,
              ),
              child: GradientText(text: 'Settings'),
            ),
            Text(
              'Customize your Wallpaper Studio experience',
              style: TextStyle(
                fontSize: context.isDesktop ? 22 : 16,
                color: const Color(0xFF575757),
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(36),
              ),
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Flex(
                direction: horizontal ? Axis.horizontal : Axis.vertical,
                mainAxisAlignment: mainAxis,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: context.isDesktop
                        ? EdgeInsets.zero
                        : EdgeInsets.symmetric(horizontal: 30),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: horizontal ? 500 : double.infinity,
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Wallpaper Setup',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Configure your wallpaper settings and enable auto-rotation',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 23),
                            SettingsBox(
                              title: 'Image Quality',
                              options: const [
                                DropdownMenuEntry(
                                  value: 'high',
                                  label: 'High (Best Quality)',
                                ),
                                DropdownMenuEntry(
                                  value: 'medium',
                                  label: 'Medium',
                                ),
                                DropdownMenuEntry(value: 'low', label: 'Low'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildNotificationContainer(),
                            const SizedBox(height: 26),
                            SettingsButtonView(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  if (horizontal) const SizedBox(width: 20),
                  if (!horizontal) const SizedBox(height: 32),

                  SizedBox(
                    height: context.isDesktop
                        ? context.height * 0.65
                        : context.height * 0.45,
                    child: Image.asset(AppImages.phone, fit: BoxFit.contain),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationContainer() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notification',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Switch(
                value: true,
                padding: EdgeInsets.zero,
                activeTrackColor: Color(0xFFFBB03B),
                onChanged: (value) {},
              ),
            ],
          ),
          Text(
            'Get notified about new wallpapers and updates',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF9C9C9C),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
