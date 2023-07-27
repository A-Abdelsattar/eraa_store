import 'package:eraa_store/blocs/auth/auth_cubit.dart';
import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/core/utils/styles.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:eraa_store/views/auth/register_view.dart';
import 'package:eraa_store/views/auth/widgets/custom_button.dart';
import 'package:eraa_store/views/auth/widgets/custom_text_field.dart';
import 'package:eraa_store/views/nav_bar_view/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/toast/toast.dart';
import '../../enums/toast_state.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState>globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState){
            ToastConfig.showToast(msg: 'Login Successfully', toastStates: ToastStates.success);
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 10.h,),
                    Image.asset('assets/images/onBoarding.jpg',width: 100,),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'تسجيل الدخول',
                      style: Styles.textStyle40.copyWith(color: AppColors.kPrimaryColor)
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
                          const Text('اذا لم تسجل حساب بالفعل؟ ',style: Styles.textStyle16),
                          TextButton(
                              onPressed: () {
                                AppNavigator.customNavigator(context: context, screen: RegisterView(), finish: true);
                              }, child:  Text('انشأ حساب',style: Styles.textStyle16.copyWith(color: Colors.blue)))
                        ],
                      ),
                    ),
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
                                label: 'البريد الالكتروني',
                                controller: cubit.emailController,
                                icon: Icons.email),
                            CustomTextField(
                              label: 'كلمة المرور',
                              controller: cubit.passwordController,
                              icon: Icons.lock,
                              isPassword: true,
                            ),
                            CustomButton(
                              onTap: () {
                                globalKey.currentState?.validate();
                                cubit.login();
                              }, widget: state is LoginLoadingState?const CircularProgressIndicator(color: Colors.white,):Text('تسجيل الدخول',style: Styles.textStyle20.copyWith(color: Colors.white),)
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
