import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BusinessListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final IconData trailingIcon;
  final Color iconColor;
  final Color trailingIconColor;
  final double iconSize;
  final double trailingIconSize;

  const BusinessListTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailingIcon = CupertinoIcons.chevron_forward,
    this.iconColor = const Color(0xFF2692FE),
    this.trailingIconColor = const Color(0xFF69696C),
    this.iconSize = 24,
    this.trailingIconSize = 18,
  });

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
                Icon(icon, color: iconColor, size: iconSize),
                SizedBox(width: 14),
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
