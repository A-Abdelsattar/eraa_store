import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap, required this.title}) : super(key: key);

  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(20.0.r),
      child: Material(
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(20.r),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            child: Center(
              child: Text(title,style: const TextStyle(color: AppColors.klightSilver,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
    );
  }
}
