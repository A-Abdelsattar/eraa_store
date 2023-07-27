import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/core/utils/styles.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:eraa_store/views/auth/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  // @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            children: [
              Image.asset(
                'assets/images/onBoarding.jpg',
                height: 300.h,
              ),
              SizedBox(height:30.h),
            const  Text(
                'كل ما تحتاج اليه في مكان واحد',
                style: Styles.textStyle40,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h,),
              Text(
                'اختر الجهاز الذي يناسبك و سنقوم بتوصيله اليك في اسرع وقت!',
                style: Styles.textStyle20.copyWith(color: AppColors.kPrimarySilverColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h,),
              Material(
                  color: AppColors.kPrimaryColor,
                borderRadius: BorderRadius.circular(20.r),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                  onTap: (){
                    AppNavigator.customNavigator(context: context, screen: RegisterView(), finish: true);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    // margin: EdgeInsets.symmetric(vertical: 5.h),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20.r), ),
                    child: Center(
                      child: Text('ابدأ الأن',style: Styles.textStyle20.copyWith(color: Colors.white),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
