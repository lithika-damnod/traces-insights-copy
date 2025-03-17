import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessListTile extends StatelessWidget {
  final IconData? icon;
  final String? svgPath;
  final String title;
  final VoidCallback? onTap;
  final IconData? trailingIcon;
  final Color iconColor;
  final Color trailingIconColor;
  final double iconSize;
  final double trailingIconSize;

  const BusinessListTile({
    super.key,
    this.icon,
    this.svgPath,
    required this.title,
    this.onTap,
    this.trailingIcon = CupertinoIcons.chevron_forward,
    this.iconColor = const Color(0xFF2692FE),
    this.trailingIconColor = const Color(0xFF69696C),
    this.iconSize = 24,
    this.trailingIconSize = 18,
  }) : assert(icon != null || svgPath != null,
            "Either an icon or svgPath must be provided.");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
            child: Row(
              children: [
                if (svgPath != null)
                  SvgPicture.asset(
                    svgPath!,
                    width: iconSize,
                    height: iconSize,
                    colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                  )
                else if (icon != null)
                  Icon(icon, color: iconColor, size: iconSize),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (trailingIcon != null)
                  Icon(trailingIcon,
                      color: trailingIconColor, size: trailingIconSize),
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.grey[700],
          thickness: 0.25,
          indent: 16,
        ),
      ],
    );
  }
}
