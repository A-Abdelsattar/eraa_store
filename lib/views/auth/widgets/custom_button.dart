import 'package:eraa_store/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap, required this.widget}) : super(key: key);

  final void Function()? onTap;
  // final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.0.w,vertical: 10.h),
      child: Material(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(20.r),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Center(
              child: widget,),
            ),
          ),
        ),
    );
  }
}
