import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/constants/app_images.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';
import 'package:wallpaper_selector/src/presentation/views/browse_view.dart';
import 'package:wallpaper_selector/src/presentation/views/favourite_view.dart';
import 'package:wallpaper_selector/src/presentation/views/home_view.dart';
import 'package:wallpaper_selector/src/presentation/views/settings_view.dart';
import 'package:wallpaper_selector/src/presentation/widgets/app_bar_button.dart';
import 'package:wallpaper_selector/src/presentation/widgets/app_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static final List<Widget> _pages =
      [HomeView(), BrowseView(), FavouriteView(), SettingsView()]
          .map(
            (page) => Navigator(
              onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => page),
            ),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.only(right: 30),
        toolbarHeight: 76,
        title: Row(
          spacing: 12,
          children: [
            Image.asset(AppImages.appIcon, height: 16),
            Text(
              'Wallpaper Studio',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),

        actions: context.isDesktop
            ? [
                AppBarButton(
                  isActive: _currentIndex == 0,
                  name: 'Home',
                  icon: AppImages.homeIcon,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                SizedBox(width: 12),
                AppBarButton(
                  isActive: _currentIndex == 1,
                  name: 'Browse',
                  icon: AppImages.browseIcon,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                SizedBox(width: 12),
                AppBarButton(
                  isActive: _currentIndex == 2,
                  name: 'Favourites',
                  icon: AppImages.favouritesIcon,
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
                SizedBox(width: 12),
                AppBarButton(
                  isActive: _currentIndex == 3,
                  name: 'Settings',
                  icon: AppImages.settingsIcon,
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                ),
              ]
            : null,
      ),
      endDrawer: context.isDesktop
          ? null
          : AppDrawer(
              onTapHome: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
              onTapBrowse: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
              onTapFavourite: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context);
              },
              onTapSettings: () {
                setState(() {
                  _currentIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
      body: IndexedStack(index: _currentIndex, children: _pages),
    );
  }
}
