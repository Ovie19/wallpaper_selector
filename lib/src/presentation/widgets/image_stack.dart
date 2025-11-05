import 'package:flutter/material.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({
    required this.image,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(image, fit: BoxFit.cover),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF878787).withValues(alpha: 0.1),
                        Color(0xFF878787).withValues(alpha: 0.15),
                      ],
                    ),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Text(
                    title,
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
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  Icons.favorite,
                  size: 17,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
