import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

import '../../../../core/routing/routes.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: ColorsManager.oceanBlue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'My Card',
          style: TextStyles.font18JetBlackMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon:
                const Icon(Icons.shopping_cart, color: ColorsManager.oceanBlue),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Card
            Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/product_card.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cement',
                            style: TextStyles.font16JetBlackMedium,
                          ),
                          verticalSpace(8),
                          Text(
                            '1899.E',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {},
                              ),
                              Text(
                                '1',
                                style: TextStyles.font16JetBlackMedium,
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Quantity Controls
                  ],
                ),
              ),
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "Promo/Student Code or Vouchers",
                style: TextStyles.font16JetBlackMedium,
              ),
            ),
            verticalSpace(24),
            const Divider(thickness: 1),
            verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sub Total',
                  style: TextStyles.font16JetBlackMedium,
                ),
                Text(
                  '1899.E',
                  style: TextStyles.font16JetBlackMedium,
                ),
              ],
            ),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyles.font16JetBlackMedium,
                ),
                Text(
                  '1899.E',
                  style: TextStyles.font16JetBlackMedium,
                ),
              ],
            ),
            verticalSpace(50),
            AppTextButton(
                onPressed: () {
                  context.pushNamed(Routes.checkOutScreen);
                },
                textButton: "Checkout")
          ],
        ),
      ),
    );
  }
}
