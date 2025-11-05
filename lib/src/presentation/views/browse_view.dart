import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/constants/app_images.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';
import 'package:wallpaper_selector/src/presentation/widgets/browse_category_list_view.dart';
import 'package:wallpaper_selector/src/presentation/widgets/categories_grid_view.dart';
import 'package:wallpaper_selector/src/presentation/widgets/category_list_view_stack.dart';
import 'package:wallpaper_selector/src/presentation/widgets/change_category_view.dart';
import 'package:wallpaper_selector/src/presentation/widgets/gradient_text.dart';

import '../../../core/constants/app_strings.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  bool isGridView = true;

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
          child: GradientText(text: AppString.brosweViewTitle),
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                AppString.brosweViewSubtitle,
                style: TextStyle(
                  fontSize: context.isDesktop ? 24 : 16,
                  color: const Color(0xFF575757),
                ),
              ),
            ),
            Row(
              spacing: 10,
              children: [
                ChangeCategoryViewButton(
                  isActive: isGridView,
                  icon: AppImages.gridIcon,
                  onTap: () => setState(() {
                    isGridView = true;
                  }),
                ),
                ChangeCategoryViewButton(
                  isActive: !isGridView,
                  icon: AppImages.listIcon,
                  onTap: () => setState(() {
                    isGridView = false;
                  }),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 50),
        if (isGridView) ...{
          context.isMobile ? CategoryListViewStack() : CategoriesGridView(),
        } else ...{
          BrowseCategoryListView(),
        },
      ],
    );
  }
}


