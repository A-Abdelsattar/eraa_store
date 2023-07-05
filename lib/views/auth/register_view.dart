import 'package:eraa_store/blocs/auth/auth_cubit.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:eraa_store/views/auth/widgets/custom_button.dart';
import 'package:eraa_store/views/auth/widgets/custom_text_field.dart';
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
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=AuthCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      'Join US',
                      style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                      child: Row(
                        children: [
                          const Text('Already have an account? '),
                          TextButton(
                              onPressed: () {}, child: const Text('Log in'))
                        ],
                      ),
                    ),
                    // Image.asset('assets/images/onBoarding.jpg',height: 200,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      padding: EdgeInsets.symmetric(vertical: 20.h),
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
                                label: 'name',
                                controller: cubit.nameController,
                                icon: Icons.person),
                            CustomTextField(
                                label: 'Email',
                                controller: cubit.emailController,
                                icon: Icons.email),
                            CustomTextField(
                              label: 'password',
                              controller: cubit.passwordController,
                              icon: Icons.lock,
                              isPassword: true,
                            ),
                            CustomTextField(
                                label: 'confirm password',
                                controller: cubit.passwordConfirmationController,
                                icon: Icons.lock),
                            CustomButton(
                              onTap: () {
                                globalKey.currentState?.validate();
                                cubit.register();
                              },
                              title: 'Register',
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
