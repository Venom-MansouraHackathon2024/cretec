import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tranquilo_app/core/helpers/constants.dart';
import 'package:tranquilo_app/core/helpers/extensions.dart';
import 'package:tranquilo_app/core/helpers/shared_pref_helper.dart';
import 'package:tranquilo_app/core/routing/routes.dart';
import 'package:tranquilo_app/core/theming/colors_manger.dart';
import 'package:tranquilo_app/core/theming/styles.dart';

class WelcomeListTile extends StatefulWidget {
  const WelcomeListTile({super.key});

  @override
  State<WelcomeListTile> createState() => _WelcomeListTileState();
}

class _WelcomeListTileState extends State<WelcomeListTile> {
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
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Good Morning,',
        style: TextStyles.font16JetBlackMedium,
      ),
      subtitle: Text(
        userName,
        style: TextStyles.font14JetBlackMedium,
      ),
      trailing: InkWell(
        onTap: () {
          context.pushNamed(Routes.notificationsScreen);
        },
        child: CircleAvatar(
          radius: 18.r,
          backgroundColor: ColorsManager.oceanBlue,
          child: SvgPicture.asset('assets/svgs/notifications_home.svg'),
        ),
      ),
    );
  }
}
