import 'package:flutter/material.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';
import 'package:tranquilo_app/core/widgets/app_text_button.dart';

import '../../../../core/routing/routes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: mediaQuery.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsManager.oceanBlue,
                    Color(0xFFDEE3FF),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/product_card.png',
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cement', style: TextStyles.font18JetBlackMedium),
                      Text('1899 L.E', style: TextStyles.font16JetBlackMedium),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('Description', style: TextStyles.font16JetBlackMedium),
                  const SizedBox(height: 10),
                  Text(
                    'Superplasticizers (SPs), also known as high-range water reducers, are chemical admixtures used to produce high-strength concrete or self-compacting concrete. These compounds allow for a reduction in water content by approximately 15%, enabling improved workability and strength in concrete mixtures.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Rate', style: TextStyles.font18JetBlackMedium),
                  const SizedBox(height: 10),
                  Row(
                    children: List.generate(4, (index) {
                      return const Icon(Icons.star,
                          color: Colors.amber, size: 24);
                    }),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: AppTextButton(
                      onPressed: () {
                        context.pushNamed(Routes.cartScreen);
                      },
                      textButton: "Add To Cart",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
