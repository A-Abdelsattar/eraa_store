import 'package:eraa_store/blocs/auth/auth_cubit.dart';
import 'package:eraa_store/core/toast/toast.dart';
import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/core/utils/styles.dart';
import 'package:eraa_store/enums/toast_state.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:eraa_store/views/auth/login_view.dart';
import 'package:eraa_store/views/auth/widgets/custom_button.dart';
import 'package:eraa_store/views/auth/widgets/custom_text_field.dart';
import 'package:eraa_store/views/home/home_view.dart';
import 'package:eraa_store/views/nav_bar_view/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState>globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState){
            ToastConfig.showToast(msg: 'Register Successfully', toastStates: ToastStates.success);
            AppNavigator.customNavigator(context: context, screen: const NavBarView(), finish: true);
          }
        },
        builder: (context, state) {
          var cubit=AuthCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.h,),
                    Image.asset('assets/images/onBoarding.jpg',width: 100,),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'انضم الينا!',
                      style: Styles.textStyle40.copyWith(
                        color: AppColors.kPrimaryColor
                      )
                      // TextStyle(
                      //     color: AppColors.kPrimaryColor,
                      //     fontSize: 40.sp,
                      //     fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Row(
                        children: [
                          const Text('هل لديك حساب بالفعل؟',style: Styles.textStyle16,),
                          TextButton(
                              onPressed: () {
                                AppNavigator.customNavigator(context: context, screen: LoginView(), finish: true);
                              }, child:  Text('سجل دخول',style: Styles.textStyle16.copyWith(color: Colors.blue),))
                        ],
                      ),
                    ),
                    // Image.asset('assets/images/onBoarding.jpg',height: 200,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                            width: 2, color: AppColors.kPrimaryColor),
                      ),
                      child: Form(
                        key: globalKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          children: [
                            CustomTextField(
                                label: 'الاسم',
                                controller: cubit.nameController,
                                icon: Icons.person),
                            CustomTextField(
                                label: 'البريد الإلكتروني',
                                controller: cubit.emailController,
                                icon: Icons.email),
                            CustomTextField(
                              label: 'كلمة المرور',
                              controller: cubit.passwordController,
                              icon: Icons.lock,
                              isPassword: true,
                            ),
                            CustomTextField(
                                label: 'تأكيد كلمة المرور',
                                controller: cubit.passwordConfirmationController,
                                icon: Icons.lock,
                              isPassword:true
                            ),

                            CustomButton(
                              onTap: () {
                                cubit.register();
                                globalKey.currentState?.validate();

                              },
                                widget:state is RegisterLoadingState?const CircularProgressIndicator(color: Colors.white,): Text('انشاء حساب',style: Styles.textStyle20.copyWith(color: Colors.white),)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
