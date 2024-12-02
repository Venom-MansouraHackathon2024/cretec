import 'dart:convert';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/features/survey/ui/widgets/list_tile_recommend.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_response_model.dart';

class SurveyResult extends StatefulWidget {
  const SurveyResult({super.key});

  @override
  State<SurveyResult> createState() => _SurveyResultState();
}

class _SurveyResultState extends State<SurveyResult> {
  double _concreteStrength = 0.0;

  @override
  void initState() {
    super.initState();
    _loadSurveyResult();
  }

  Future<void> _loadSurveyResult() async {
    final resultJson = await SharedPrefHelper.getSurveyResult();
    if (resultJson != null && resultJson.isNotEmpty) {
      final Map<String, dynamic> jsonMap = jsonDecode(resultJson);
      final surveyResult = SurveyResponseModel.fromJson(jsonMap);
      setState(() {
        _concreteStrength = surveyResult.concreteCompressiveStrength;
      });
    } else {
      debugPrint('No survey result found in SharedPreferences');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(40),
              Text(
                'Concrete compressive strength Result',
                textAlign: TextAlign.center,
                style: TextStyles.font20JetBlackSemiBold,
              ),
              verticalSpace(5),
              SvgPicture.asset(
                'assets/svgs/survey_result.svg',
                width: 327.w,
                height: 327.h,
                fit: BoxFit.contain,
              ),
              verticalSpace(16),
              Text(
                'The final compressive strength of the concrete (in MPa)',
                textAlign: TextAlign.center,
                style: TextStyles.font16JetBlackMedium,
              ),
              verticalSpace(12),
              Text(
                'Concrete Compressive Strength\n=$_concreteStrength',
                textAlign: TextAlign.start,
                style: TextStyles.font14JetBlackMedium,
              ),
              verticalSpace(40),
              AppTextButton(
                textButton: 'Continue to Home',
                onPressed: () {
                  context.pushNamedAndRemoveUntil(
                    Routes.appLayout,
                    predicate: (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
