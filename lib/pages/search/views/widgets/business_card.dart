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

  // ✅ Common TextStyle
  static const TextStyle commonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'SF Pro Text',
    fontWeight: FontWeight.w500,
    letterSpacing: -0.43,
  );

  // ✅ Build Business Logo
  Widget _buildLogo(String logoUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.94),
      child: logoUrl.startsWith('http')
          ? Image.network(
              logoUrl,
              width: 47.37,
              height: 47.37,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 45, color: Colors.grey),
            )
          : Image.asset(
              logoUrl,
              width: 47.37,
              height: 47.37,
              fit: BoxFit.cover,
            ),
    );
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
                        style: commonTextStyle.copyWith(fontSize: 19),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Opacity(
                            opacity: 0.70,
                            child: Text(country, style: commonTextStyle),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: Color(0xFF535353),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Opacity(
                            opacity: 0.50,
                            child: Text(category, style: commonTextStyle),
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
                    style: commonTextStyle.copyWith(
                      fontSize: 17,
                      color: const Color(0xBFD0DA57),
                    ),
                  ),
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
