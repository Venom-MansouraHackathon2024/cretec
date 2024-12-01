import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/helpers/show_snack_bar.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';
import 'package:tranquilo_app/core/widgets/app_text_form_field.dart';
import 'package:tranquilo_app/features/survey/logic/survey_cubit.dart';
import 'package:tranquilo_app/features/survey/logic/survey_state.dart';
import 'package:tranquilo_app/features/survey/data/model/survey_request_model.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class SurveyPageViewBuilder extends StatefulWidget {
  const SurveyPageViewBuilder({super.key});

  @override
  State<SurveyPageViewBuilder> createState() => _SurveyPageViewBuilderState();
}

class _SurveyPageViewBuilderState extends State<SurveyPageViewBuilder> {
  int _currentStep = 0;
  final PageController _controller = PageController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _superplasticizerController = TextEditingController();
  final TextEditingController _cementController = TextEditingController();
  final TextEditingController _blastFurnaceSlagController = TextEditingController();
  final TextEditingController _fineAggregateController = TextEditingController();
  final TextEditingController _flyAshController = TextEditingController();
  final TextEditingController _waterController = TextEditingController();
  final TextEditingController _coarseAggregateController = TextEditingController();
  final List<Map<String, dynamic>> _surveyData = [
    {
      'question': 'What is the amount of cement used (kg/m³) ?',
      'type': 'input',
      'controller': null,
    },
    {
      'question': 'How many days was the concrete left to dry?',
      'type': 'mcq',
      //'answers': ['Male', 'Female', 'Other'],
      'selectedAnswer': null,
    },
    {
      'question': 'What is your BMI?',
      'type': 'input',
      'controller': null, // this will use _bmiController later
    },
    {
      'question': 'WHO BMI classification',
      'type': 'mcq',
      'answers': ['Underweight', 'Normal', 'Overweight', 'Obesity'],
      'selectedAnswer': null,
    },
    {
      'question': 'How often do you feel depressed?',
      'type': 'mcq',
      'answers': ['1', '2', '3', '4', '5'],
      'selectedAnswer': null,
    },
    {
      'question': 'Have you ever been diagnosed with depression?',
      'type': 'mcq',
      'answers': ['Yes', 'No'],
      'selectedAnswer': null,
    },
    {
      'question': 'Are you currently receiving treatment for depression?',
      'type': 'mcq',
      'answers': ['Yes', 'No'],
      'selectedAnswer': null,
    },
    {
      'question': 'How often do you feel anxious?',
      'type': 'mcq',
      'answers': ['1', '2', '3', '4', '5'],
      'selectedAnswer': null,
    },
    {
      'question': 'Have you ever been diagnosed with anxiety?',
      'type': 'mcq',
      'answers': ['Yes', 'No'],
      'selectedAnswer': null,
    },
    {
      'question': 'Are you currently receiving treatment for anxiety?',
      'type': 'mcq',
      'answers': ['Yes', 'No', 'Maybe'],
      'selectedAnswer': null,
    },
    {
      'question': 'How often do you feel sleepy during the day?',
      'type': 'mcq',
      'answers': ['1', '2', '3', '4', '5'],
      'selectedAnswer': null,
    },
  ];

  @override
  void initState() {
    super.initState();
    // Assign controllers for the text input questions
    _surveyData[0]['controller'] = _cementController;
    _surveyData[1]['controller'] = _blastFurnaceSlagController;
    _surveyData[2]['controller'] = _flyAshController;
    _surveyData[3]['controller'] = _waterController;
    _surveyData[4]['controller'] = _superplasticizerController;
    _surveyData[5]['controller'] = _coarseAggregateController;
    _surveyData[6]['controller'] = _fineAggregateController;
    _surveyData[7]['controller'] = _ageController;
  }
  SurveyRequestModel _buildSurveyRequest() {
    return SurveyRequestModel(
      age: int.parse(_ageController.text),
      coarseAggregate: int.parse(_coarseAggregateController.text),
      cement: int.parse(_cementController.text),
      fineAggregate: int.parse(_fineAggregateController.text),
      water: int.parse(_waterController.text),
      blastFurnaceSlag: int.parse(_blastFurnaceSlagController.text),
      superplasticizer: int.parse(_superplasticizerController.text),
      flyAsh: double.parse(_flyAshController.text),
    );
  }

  void _nextPage() {
    if (_surveyData[_currentStep]['type'] == 'mcq' &&
        _surveyData[_currentStep]['selectedAnswer'] == null) {
      showSnackBar(
        context,
        'Please select an answer before proceeding',
        ColorsManager.oceanBlue,
      );
    } else if (_surveyData[_currentStep]['type'] == 'input' &&
        _surveyData[_currentStep]['controller'].text.isEmpty) {
      showSnackBar(
        context,
        'Please fill in the required field',
        ColorsManager.oceanBlue,
      );
    } else if (_currentStep < _surveyData.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentStep > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyCubit, SurveyState>(
      listener: (context, state) {
        if (state is Error) {
          showSnackBar(context, state.error.message, Colors.red);
        } else if (state is Success) {
          context.pushNamed(Routes.surveyCompleted);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height*0.6,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentStep = index;
              });
            },
            itemCount: _surveyData.length,
            itemBuilder: (context, index) {
              final questionType = _surveyData[index]['type'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  verticalSpace(40),
                  Text(
                    'Step ${index + 1} of ${_surveyData.length}',
                    style: TextStyles.font20OceanBlueSemiBold
                        .copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(32),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      _surveyData[index]['question'],
                      style: TextStyles.font18JetBlackMedium,
                    ),
                  ),
                  verticalSpace(16),
                  if (questionType == 'mcq') ...[
                    ..._surveyData[index]['answers'].map((answer) {
                      return RadioListTile(
                        fillColor: const WidgetStatePropertyAll<Color>(ColorsManager.oceanBlue),
                        title: Text(
                          answer,
                          style: TextStyles.font14JetBlackMedium,
                        ),
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        dense: true,
                        value: answer,
                        groupValue: _surveyData[index]['selectedAnswer'],
                        onChanged: (value) {
                          setState(() {
                            _surveyData[index]['selectedAnswer'] = value;
                          });
                        },
                      );
                    }).toList(),
                    verticalSpace(24),

                  ],
                  if (questionType == 'input') ...[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: AppTextFormField(
                        controller: _surveyData[index]['controller'],
                        hintText: 'Enter your answer',
                        keyboardType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                      ),
                    ),
                    verticalSpace(48),
                  ],
                  Row(
                    children: [
                      if (_currentStep > 0)
                        Expanded(
                          child: AppTextButton(
                            onPressed: _prevPage,
                            textButton: 'Back',
                            backgroundColor: ColorsManager.white,
                            textColor: ColorsManager.oceanBlue,
                            borderColor: ColorsManager.oceanBlue,
                          ),
                        ),
                      Expanded(
                        child: AppTextButton(
                          onPressed: () async {
                            if (_currentStep == _surveyData.length - 1) {
                              final request = _buildSurveyRequest();
                              context.read<SurveyCubit>().submitSurvey(request);
                              await SharedPrefHelper.setSurveyCompleted(true);
                            } else {
                              _nextPage();
                            }
                          },
                          textButton: _currentStep == _surveyData.length - 1
                              ? 'Finish'
                              : 'Next',
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
