import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class SelectCategory extends StatelessWidget {
  final String category;
  final String svgAssetPath;
  final bool isSelected;

  const SelectCategory({
    super.key,
    required this.category,
    required this.svgAssetPath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.oceanBlue
                : ColorsManager.containerSilver,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            svgAssetPath,
            width: 34,
            height: 34,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.white : const Color(0xFFB5BBC0),
              BlendMode.srcIn,
            ),
          ),
        ),
        verticalSpace(8),
        Text(
          category,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          textAlign: TextAlign.center, // Center the text
          style: TextStyle(
            color: isSelected ? ColorsManager.oceanBlue : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
