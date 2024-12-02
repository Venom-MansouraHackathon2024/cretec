import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class EarnPointsText extends StatelessWidget {
  const EarnPointsText({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: 50.w,
        height: 50.h,
        child: ClipOval(
          child: SvgPicture.asset('assets/svgs/earn_points.svg'),
        ),
      ),
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Earn points with every purchase and redeem exclusive rewards! ",
              style: TextStyles.font12JetBlackMedium,
            ),
            TextSpan(
              text: "Learn more",
              style: TextStyles.font12JetBlackMedium.copyWith(
                color: const Color(0xFF92181A),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
