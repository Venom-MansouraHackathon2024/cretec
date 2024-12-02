import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/features/home/ui/widgets/categories_list.dart';
import 'package:tranquilo_app/features/home/ui/widgets/earn_points_text.dart';
import 'package:tranquilo_app/features/home/ui/widgets/product_card.dart';
import 'package:tranquilo_app/features/home/ui/widgets/promotion_banner.dart';
import 'package:tranquilo_app/features/home/ui/widgets/search_bar.dart';
import 'package:tranquilo_app/features/home/ui/widgets/welcome_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                const WelcomeListTile(),
                verticalSpace(12),
                const SearchBarField(),
                verticalSpace(20),
                const PromotionBanner(),
                verticalSpace(20),
                const EarnPointsText(),
                verticalSpace(20),
                const CategoriesList(),
                verticalSpace(20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}