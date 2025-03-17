import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BusinessCard extends StatelessWidget {
  final String logoUrl;
  final String businessName;
  final String country;
  final String category;
  final double rating;

  const BusinessCard({
    super.key,
    required this.logoUrl,
    required this.businessName,
    required this.country,
    required this.category,
    required this.rating,
  });

  static const TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'SF Pro Text',
    fontWeight: FontWeight.w500,
    letterSpacing: -0.43,
  );

  Widget _buildLogo(String logoUrl) {
    if (logoUrl.startsWith('http')) {
      // ✅ Load network image
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.94),
        child: Image.network(
          logoUrl,
          width: 47.37,
          height: 47.37,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 45, color: Colors.grey),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.94),
        child: Image.asset(
          logoUrl,
          width: 47.37,
          height: 47.37,
          fit: BoxFit.cover,
        ),
      );
    }
  }

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
              Row(
                children: [
                  _buildLogo(logoUrl),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        businessName,
                        style: textStyle.copyWith(fontSize: 19),
                      ),
                      const SizedBox(height: 0),
                      Row(
                        children: [
                          Opacity(
                            opacity: 0.70,
                            child: Text(country, style: textStyle),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.circle,
                              size: 5, color: Color(0xFF535353)), // ✅ Small dot
                          const SizedBox(width: 6),
                          Opacity(
                            opacity: 0.50,
                            child: Text(category, style: textStyle),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.star_fill,
                    color: Color(0xBFD0DA57),
                    size: 17,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${rating.toStringAsFixed(1)} / 5',
                    style: textStyle.copyWith(
                        fontSize: 17, color: const Color(0xBFD0DA57)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 0.25,
          width: double.infinity,
          color: Colors.grey.shade700,
          margin: const EdgeInsets.symmetric(horizontal: 0),
        ),
      ],
    );
  }
}
