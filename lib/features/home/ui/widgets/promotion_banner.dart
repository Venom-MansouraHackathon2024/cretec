import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 0.w,vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorsManager.containerSilver,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    '25% Off',
                    style: TextStyles.font20JetBlackSemiBold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'Sep 4 - Sep 14',
                    style: TextStyles.font12JetBlackRegular.copyWith(
                      color: const Color(0xFFB30C0C),
                    ),
                  ),
                ),
                verticalSpace(10.h),
                AppTextButton(
                  onPressed: () {},
                  textButton: 'Order Now',
                  fontSize: 12.sp,
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/banner.png",
            height: 120.h,
          ),
        ],
      ),
    );
  }
}
