import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/constants/app_images.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';
import 'package:wallpaper_selector/src/presentation/views/preview_view.dart';
import 'package:wallpaper_selector/src/presentation/widgets/gradient_text.dart';
import 'package:wallpaper_selector/src/presentation/widgets/image_stack.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: context.isDesktop ? context.width * 0.3 : 20,
              ),
              child: GradientText(text: 'Saved Wallpapers'),
            ),
            SizedBox(height: 8),
            Text(
              'Your saved wallpapers collection',
              style: TextStyle(
                fontSize: context.isDesktop ? 22 : 16,
                color: const Color(0xFF575757),
              ),
            ),
            SizedBox(height: 30),

            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                int imageNumber = index + 1;
                if (index > 5) imageNumber = (index % 6) + 1;

                return ImageStack(
                  image: '${AppImages.baseImages}/nature_$imageNumber.jpg',
                  title: 'Nature',
                  subtitle: 'Nature ${index + 1}',
                );
              },
            ),

            /// For the empty favourites
            // Expanded(
            //   child: Center(
            //     child: Column(
            //       mainAxisSize: MainAxisSize.max,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Image.asset(AppImages.emptySavedWallpaper),
            //         Text(
            //           'No Saved Wallpapers',
            //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            //         ),
            //         SizedBox(height: 12),
            //         Text(
            //           'Start saving your favorite wallpapers to see them here',
            //           style: TextStyle(fontSize: 14),
            //         ),
            //         SizedBox(height: 20),
            //         ElevatedButton(
            //           onPressed: () {},
            //           style: ElevatedButton.styleFrom(
            //             padding: EdgeInsets.symmetric(
            //               horizontal: 32,
            //               vertical: 20,
            //             ),
            //             foregroundColor: Colors.white,
            //             backgroundColor: Color(0xFFFBB03B),
            //           ),
            //           child: Text(
            //             'Browse Wallpapers',
            //             style: TextStyle(fontSize: 14),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
