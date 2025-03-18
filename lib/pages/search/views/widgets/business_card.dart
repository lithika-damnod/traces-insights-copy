import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BusinessCard extends StatelessWidget {
  final String logoUrl;
  final String businessName;
  final String country;
  final String category;
  final double rating;
  final bool showRatingText;
  final IconData customIcon;
  final Color ratingColor;
  final Color iconColor;

  /// ✅ Set default colors here
  const BusinessCard({
    super.key,
    required this.logoUrl,
    required this.businessName,
    required this.country,
    required this.category,
    required this.rating,
    this.showRatingText = true, // ✅ Default: Show rating text
    this.customIcon = CupertinoIcons.star_fill, // ✅ Default: Star icon
    this.ratingColor = Colors.white, // ✅ Default: White text
    this.iconColor = Colors.white, // ✅ Default: White icon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ✅ Left Side: Logo + Business Info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.94),
                    child: Image.asset(
                      logoUrl,
                      width: 47.37,
                      height: 47.37,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        businessName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Opacity(
                            opacity: 0.70,
                            child: Text(
                              country,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(84, 83, 83, 1),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Opacity(
                            opacity: 0.50,
                            child: Text(
                              category,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// ✅ Right Side: Icon + Optional Rating Text
              Row(
                children: [
                  Icon(
                    customIcon, // ✅ Custom icon dynamically
                    color: iconColor, // ✅ Custom icon color
                    size: 17,
                  ),
                  const SizedBox(width: 4),
                  showRatingText // ✅ Conditionally show rating text
                      ? Text(
                          '${rating.toStringAsFixed(1)} / 5',
                          style: TextStyle(
                            fontSize: 17,
                            color: ratingColor, // ✅ Custom rating text color
                          ),
                        )
                      : const SizedBox(), // ❌ Hide text if false
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 0,
          thickness: 0.5,
          color: Color.fromRGBO(84, 84, 88, 0.65),
        ),
      ],
    );
  }
}
