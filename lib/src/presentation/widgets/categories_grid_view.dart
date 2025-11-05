import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';
import 'package:wallpaper_selector/src/presentation/views/preview_view.dart';
import 'package:wallpaper_selector/src/presentation/widgets/category_box.dart';

import '../../../core/models/categories.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktop ? 3 : 2,
        childAspectRatio: 453 / 290,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () =>  Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PreviewScreen(),
            ),
          ),
          child: CategoryBox(
            image: category.imageUrl,
            title: category.title,
            subtitle: category.subtitle,
            noOfWallpaper: category.noOfWallpapers,
          ),
        );
      },
    );
  }
}