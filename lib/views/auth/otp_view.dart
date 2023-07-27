import 'package:eraa_store/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../src/app_colors.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 80.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'التحقق من البريد الالكتروني',
                style: Styles.textStyle20.copyWith(fontSize: 30.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 2.w),
                child: RichText(
                  text: TextSpan(
                    text: 'وصلتك رسالة تأكيد مكونه من 6 ارقام على البريد ',
                    style: Styles.textStyle16.copyWith(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'ahmed@gmail.com',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  autoFocus: true,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    borderWidth: 1,
                    activeColor: AppColors.kPrimaryColor,
                    inactiveColor: AppColors.kPrimaryColor,
                    inactiveFillColor: Colors.white,
                    activeFillColor: Colors.cyan,
                    selectedColor: AppColors.kPrimaryColor,
                    selectedFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  onCompleted: (submitedCode) {
                    // otpCode = submitedCode;
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              SizedBox(height: 40.h,),
              ElevatedButton(onPressed: (){}, child: Text('تأكيد',style: Styles.textStyle16.copyWith(color: Colors.white),),style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                minimumSize:Size(110.w, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
                )
              ),)
            ],
          ),
        ),
      ),
    ));
  }
}
