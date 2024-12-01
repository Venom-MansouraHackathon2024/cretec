import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

import '../widgets/survey_page_view_builder.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              verticalSpace(40),
              Text(
                'Concrete compressive strenght',
                style: TextStyles.font20JetBlackSemiBold,
                textAlign: TextAlign.center,
              ),
              verticalSpace(32),
              Text(
                "Enter the required quantity to help us calculate\nyour concrete's compressive strength\naccurately",
                style: TextStyles.font14JetBlackLight,
                textAlign: TextAlign.center,
              ),
              verticalSpace(48),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsManager.containerSilver,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const SurveyPageViewBuilder(),
              ),
              verticalSpace(80),
            ],
          ),
        ),
      ),
    );
  }
}

