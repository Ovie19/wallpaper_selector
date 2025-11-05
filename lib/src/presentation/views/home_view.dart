import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';
import 'package:wallpaper_selector/src/presentation/widgets/categories_grid_view.dart';
import 'package:wallpaper_selector/src/presentation/widgets/category_list_view_stack.dart';
import 'package:wallpaper_selector/src/presentation/widgets/gradient_text.dart';

import '../../../core/constants/app_strings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: context.isDesktop ? context.width * 0.3 : 20,
          ),
          child: GradientText(text: AppString.homepageTitle),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.only(
            right: context.isDesktop ? context.width * 0.35 : 50,
          ),
          child: Text(
            AppString.homepageSubtitle,
            style: TextStyle(
              fontSize: context.isDesktop ? 24 : 16,

              color: const Color(0xFF575757),
            ),
          ),
        ),
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                fontSize: context.isMobile ? 24 : 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => debugPrint('view all'),
              child: Text(
                'See All',
                style: TextStyle(
                  color: Color(0xFF808080),
                  fontSize: context.isMobile ? 16 : 24,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        context.isMobile ? CategoryListViewStack() : CategoriesGridView(),
      ],
    );
  }
}
