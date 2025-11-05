import 'package:flutter/material.dart';
import 'package:wallpaper_selector/src/presentation/widgets/category_box.dart';

import '../../../core/models/categories.dart';

class CategoryListViewStack extends StatelessWidget {
  const CategoryListViewStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryBox(
          image: category.imageUrl,
          title: category.title,
          subtitle: category.subtitle,
          noOfWallpaper: category.noOfWallpapers,
        );
      },
      separatorBuilder: (_, __) => SizedBox(height: 20),
      itemCount: categories.length,
    );
  }
}