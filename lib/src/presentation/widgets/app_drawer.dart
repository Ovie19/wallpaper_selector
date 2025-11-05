import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/constants/app_images.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    required this.onTapHome,
    required this.onTapBrowse,
    required this.onTapFavourite,
    required this.onTapSettings,
    super.key,
  });

  final VoidCallback onTapHome;
  final VoidCallback onTapBrowse;
  final VoidCallback onTapFavourite;
  final VoidCallback onTapSettings;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * .75,
      shape: ContinuousRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(AppImages.homeIcon, height: 20),
              title: const Text('Home'),
              onTap: onTapHome,
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(AppImages.browseIcon, height: 20),
              title: const Text('Browse'),
              onTap: onTapBrowse,
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(AppImages.favouritesIcon, height: 20),
              title: const Text('Favourites'),
              onTap: onTapFavourite,
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(AppImages.settingsIcon, height: 20),
              title: const Text('Settings'),
              onTap: onTapSettings,
            ),
          ],
        ),
      ),
    );
  }
}
