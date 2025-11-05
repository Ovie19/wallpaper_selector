import 'package:flutter/material.dart';
import 'package:wallpaper_selector/core/extensions/responsive_context_extension.dart';
import 'package:wallpaper_selector/src/presentation/views/right_side_dialog.dart';
import 'package:wallpaper_selector/src/presentation/widgets/change_category_view.dart';

import '../../../core/constants/app_images.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.isDesktop ? 48 : 24,
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 80),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            spacing: 5,
                            children: [
                              Icon(Icons.arrow_back),
                              Text('Back to categories'),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Nature',
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
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: context.isDesktop ? 3 : 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      '${AppImages.baseImages}/nature_${index + 1}.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withValues(alpha: 0.5),
                                          ],
                                          stops: const [0.3, 1.0],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      bottom: 15,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Nature ${index + 1}',
                                            style: TextStyle(
                                              fontSize: 19,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2,
                                              horizontal: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Color(
                                                    0xFF878787,
                                                  ).withValues(alpha: 0.1),
                                                  Color(
                                                    0xFF878787,
                                                  ).withValues(alpha: 0.15),
                                                ],
                                              ),
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Text(
                                              'Nature',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 12,
                                      top: 12,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(
                                                0xFF878787,
                                              ).withValues(alpha: 0.7),
                                              Color(
                                                0xFF878787,
                                              ).withValues(alpha: 0.15),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.favorite_outline_outlined,
                                            size: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        } else ...{
                          // TODO: ListView version
                        },
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    width: 400,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white.withValues(alpha: 0.17),
                        ],
                      ),
                    ),
                    child: Column(
                      spacing: 50,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Preview',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Text(
                                    'Nature 1',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    'Tags',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 5,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Text('Nature'),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Text('Ambience'),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                        ),
                                        child: Text('Flowers'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Text(
                                    'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences. Let this unique collection elevate your senses and connect you with the unrefined elegance of the natural world. Embrace "Natural Essence" for a truly organic transformation in your daily life.',
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  SizedBox(height: 15),
                                  Row(
                                    spacing: 12,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0x7C7C7C1A,
                                          ).withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            AppImages.shareIcon,
                                            color: Color(0xFF808080),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: Color(
                                            0x7C7C7C1A,
                                          ).withValues(alpha: 0.1),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            AppImages.zoomIcon,
                                            color: Color(0xFF808080),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => _showRightSidePanel(context),
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            color: Color(
                                              0x7C7C7C1A,
                                            ).withValues(alpha: 0.1),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              AppImages.settingsIcon,
                                              color: Color(0xFF808080),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                AppImages.previewDevice,
                                height: context.height * .55,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 20,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(21),
                                border: Border.all(color: Color(0xFFDFDFDF)),
                              ),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.favorite_outline_outlined,
                                    size: 17,
                                  ),
                                  Text('Save to Favorites'),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(21),
                                color: Color(0xFFFBB03B),
                              ),
                              child: Text(
                                'Set to Wallpaper',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showRightSidePanel(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "SidePanel",
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.3),
    useRootNavigator: true,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => const RightSidePanel(),
    transitionBuilder: (_, animation, __, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
        child: child,
      );
    },
  );
}
