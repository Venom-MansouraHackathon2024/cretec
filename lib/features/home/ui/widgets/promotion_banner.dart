import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '25% Off',
                    style: TextStyles.font20JetBlackSemiBold,
                  ),
                  Text(
                    'Sep 4 - Sep 14',
                    style: TextStyles.font14JetBlackMedium,
                  ),
                  verticalSpace(10.h),
                  AppTextButton(onPressed: (){}, textButton: 'Order Now'),
                ],
              ),
            ),
            Image.asset(
              "assets/images/banner.png",
              fit: BoxFit.contain,
              height: 149.h,
            ),
          ],
        ),
      ),
    );
  }
}
