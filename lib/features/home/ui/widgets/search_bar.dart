import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tranquilo_app/core/helpers/show_dialog.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(

      onSubmitted: (value){
        //BlocProvider.of<SearchResultCubit>(context).fetchSearchResult(subject: value);
      },
      //style: TextStyles.font14Regular.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        prefixIcon: const Icon(
          Icons.search,
          size: 25,
          color: ColorsManager.oceanBlue,
        ),
      ),
    );

  }
  OutlineInputBorder buildOutlineInputBorder(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: Colors.grey),
    );
  }
}