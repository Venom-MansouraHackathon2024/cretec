import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/features/home/ui/widgets/select_category.dart';

class CategoriesList extends StatefulWidget {

  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
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
    return                 SingleChildScrollView(
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
    );

  }
}
