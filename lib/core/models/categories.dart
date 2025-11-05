import 'package:wallpaper_selector/core/constants/app_images.dart';

class Categories {
  Categories({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.noOfWallpapers,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
  final int noOfWallpapers;
}

List<Categories> categories = [
  Categories(
    title: 'Nature',
    subtitle: 'Mountains, Forest and Landscapes',
    imageUrl: AppImages.nature,
    noOfWallpapers: 3,
  ),
  Categories(
    title: 'Abstract',
    subtitle: 'Modern Geometric and artistic designs',
    imageUrl: AppImages.abstract,
    noOfWallpapers: 4,
  ),
  Categories(
    title: 'Urban',
    subtitle: 'Cities, architecture and street',
    imageUrl: AppImages.urban,
    noOfWallpapers: 6,
  ),
  Categories(
    title: 'Space',
    subtitle: 'Cosmos, planets, and galaxies',
    imageUrl: AppImages.space,
    noOfWallpapers: 3,
  ),
  Categories(
    title: 'Minimalist',
    subtitle: 'Clean, simple, and elegant',
    imageUrl: AppImages.minimalist,
    noOfWallpapers: 6,
  ),
  Categories(
    title: 'Animals',
    subtitle: 'Wildlife and nature photography',
    imageUrl: AppImages.animals,
    noOfWallpapers: 4,
  ),
];
