import 'package:eraa_store/blocs/auth/auth_cubit.dart';
import 'package:eraa_store/blocs/brand/brand_cubit.dart';
import 'package:eraa_store/blocs/cart/cart_cubit.dart';
import 'package:eraa_store/blocs/category/category_cubit.dart';
import 'package:eraa_store/blocs/favorite/favorite_cubit.dart';
import 'package:eraa_store/blocs/order/order_cubit.dart';
import 'package:eraa_store/blocs/profile/profile_cubit.dart';
import 'package:eraa_store/views/auth/otp_view.dart';
import 'package:eraa_store/views/on_boarding/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/nav/nav_cubit.dart';
import '../blocs/product/product_cubit.dart';
import '../blocs/slider/slider_cubit.dart';
import '../views/offline/offline_view.dart';

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
            BlocProvider(create: (context)=>BrandCubit()..getAllBrands()),
            BlocProvider(create: (context)=>NavCubit()),
            BlocProvider(create: (context)=>CategoryCubit()..getAllCategories()),
            BlocProvider(create: (context)=>ProductCubit()..getAllProducts()),
            BlocProvider(create: (context)=>FavoriteCubit()..getFavoriteProducts()),
            BlocProvider(create: (context)=>CartCubit()..getCart()),
            BlocProvider(create: (context)=>ProfileCubit()..getUserData()),
            BlocProvider(create: (context)=>SliderCubit()..getSlider()),
            BlocProvider(create: (context)=>OrderCubit()..getOrderHistory()),
          ],
          child: MaterialApp(
            localizationsDelegates:const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales:const [
              Locale("ar", ""),
              // OR Locale('ar', 'AE') OR Other RTL locales
            ],
            locale:const Locale("ar", ""),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: Colors.blue,
            ),
            home:OfflineBuilder(
              connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                  ) {
                final bool connected = connectivity != ConnectivityResult.none;
                if (connected){
                  return  OnBoardingView();
                  // return const CheckOutView();
                }
                else{
                  return const OfflineView();
                }
              },
              child:const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }
}