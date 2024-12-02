import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/spacing.dart';
import 'package:tranquilo_app/features/home/ui/widgets/earn_points_text.dart';
import 'package:tranquilo_app/features/home/ui/widgets/product_card.dart';
import 'package:tranquilo_app/features/home/ui/widgets/promotion_banner.dart';
import 'package:tranquilo_app/features/home/ui/widgets/search_bar.dart';
import 'package:tranquilo_app/features/home/ui/widgets/select_category.dart';
import 'package:tranquilo_app/features/home/ui/widgets/welcome_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Map<String, String>> categories = [
    {'name': 'Popular', 'icon': 'assets/svgs/star.svg'},
    {'name': 'Cement', 'icon': 'assets/svgs/material.svg'},
    {'name': 'Fly Ash', 'icon': 'assets/svgs/material.svg'},
    {'name': 'Blast', 'icon': 'assets/svgs/material.svg'},
    {'name': 'Superplasticizer', 'icon': 'assets/svgs/material.svg'},
  ];

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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: SizedBox(
                          width: 50.w,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = categories.indexOf(category);
                              });
                            },
                            child: SelectCategory(
                              category: category['name']!,
                              svgAssetPath: category['icon']!,
                              isSelected: selectedIndex == categories.indexOf(category),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                verticalSpace(20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ProductCard();
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
