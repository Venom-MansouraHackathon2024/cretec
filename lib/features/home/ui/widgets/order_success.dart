import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

import '../../../../core/routing/routes.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/images/order_success.png",
                height: 300,
              ),
              Text(
                "Order Success!",
                style: TextStyles.font24OceanBlueSemiBold,
              ),
              verticalSpace(12),
              Text(
                "Your order has been placed successfully!",
                style: TextStyles.font14lightGreyRegular,
              ),
              verticalSpace(30),
              AppTextButton(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(
                    Routes.appLayout,
                    predicate: (Route<dynamic> route) => false,
                  );
                },
                textButton: "Continue Shopping",
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
