import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';

class PointsReward extends StatefulWidget {
  const PointsReward({super.key});

  @override
  State<PointsReward> createState() => _PointsRewardState();
}

class _PointsRewardState extends State<PointsReward> {
  String userName = '';

  void getUserName() async {
    userName = await SharedPrefHelper.getString(SharedPrefKeys.userName);
    setState(() {});
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Image.asset("assets/images/points_header.png"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  "Welcome,  $userName\nto your reward",
                  style: TextStyles.font20OceanBlueSemiBold,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              width: mediaQuery.width * 0.5,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '200',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    horizontalSpace(10),
                    const Text(
                      'Points',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                border: Border.all(color: Colors.orange),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange),
                  SizedBox(width: 8),
                  Text(
                    '122 Points will expire on 10 June 2023',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Famous companies now',
              style: TextStyles.font20OceanBlueSemiBold.copyWith(fontSize: 18),
            ),
          ),
          verticalSpace(20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 4, // Number of items
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showDetailsDialog(context);
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/images/product_card.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Discount 300 L.E on Superplasticizer',
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(height: 4),
                              Text('800 Point',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/dialog_header.png',
                      // height: 150,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Chip(
                        label: Text(
                          'Minimum: 800 L.E',
                          style: TextStyles.font12LightSilverMedium,
                        ),
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Discount 300 L.E on Cement',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  '800 Point\nSave 800 pounds off your order',
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                const Text(
                  'Number of points currently: 200\nYou need 700 points to enjoy this offer',
                ),
                const SizedBox(height: 16),
                AppTextButton(
                  onPressed: () {},
                  textButton: "Use a shake for 700 L.E",
                  backgroundColor: ColorsManager.oceanBlue.withOpacity(0.5),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
