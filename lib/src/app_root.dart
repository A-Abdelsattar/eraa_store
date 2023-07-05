import 'package:eraa_store/blocs/auth/auth_cubit.dart';
import 'package:eraa_store/views/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context)=>AuthCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.blue,
            ),
            home:const OnBoardingView(),
          ),
        );
      },
    );
  }
}