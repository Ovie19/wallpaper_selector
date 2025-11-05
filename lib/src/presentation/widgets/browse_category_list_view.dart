import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';
import 'package:wallpaper_selector/src/presentation/views/preview_view.dart';
import 'glass_morph_text.dart';

import '../../../core/models/categories.dart';

class BrowseCategoryListView extends StatelessWidget {
  const BrowseCategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () =>  Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PreviewScreen(),
            ),
          ),
          child: Container(
            height: 150,
            margin: EdgeInsets.only(bottom: 10, top: 20),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: context.isMobile ? 1 : 3 / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(category.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(
                        context.isMobile ? 17 : 9,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.title,
                        style: TextStyle(
                          fontSize: context.isMobile ? 20 : 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        category.subtitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      GlassMorphText(
                        noOfWallpaper: category.noOfWallpapers,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => Divider(),
      itemCount: categories.length,
    );
  }
}
