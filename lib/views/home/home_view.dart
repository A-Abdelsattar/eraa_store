import 'package:eraa_store/blocs/brand/brand_cubit.dart';
import 'package:eraa_store/blocs/slider/slider_cubit.dart';
import 'package:eraa_store/views/home/widgets/brand_list_view.dart';
import 'package:eraa_store/views/home/widgets/category_list_view.dart';
import 'package:eraa_store/views/home/widgets/custom_drawer.dart';
import 'package:eraa_store/views/home/widgets/image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/styles.dart';
import '../../src/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandCubit, BrandState>(
      listener: (context, state) {},
      builder: (context, state) {
        var brandCubit = BrandCubit.get(context);
        return SafeArea(
          child: Scaffold(
            key: brandCubit.globalKey,
            drawer: const CustomDrawer(),
            body:  ListView(

                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            brandCubit.globalKey.currentState!.openDrawer();
                          },
                          icon: const Icon(Icons.filter_list)),
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.h),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  label: Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 8.0.w),
                                    child: const Text('بحث'),
                                  ),
                                  suffixIcon: const Icon(Icons.search),
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 5.h)),
                            ),
                          ))
                    ],
                  ),
                  const ImageCarousel(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 5.0.h, horizontal: 15.w),
                    child: Text(
                      "العلامات التجاريه",
                      style: Styles.textStyle20
                          .copyWith(color: AppColors.kPrimaryColor),
                    ),
                  ),
                  brandCubit.brandModel == null
                      ? const Center(child: CircularProgressIndicator())
                      : const BrandListView(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 15.w),
                    child: Text(
                      "التصنيفات",
                      style: Styles.textStyle20
                          .copyWith(color: AppColors.kPrimaryColor)
                          .copyWith(fontSize: 20),
                    ),
                  ),
                  brandCubit.brandModel == null
                      ? const Center(child: CircularProgressIndicator())
                      : const CategoryListView(),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: 10.0.h, horizontal: 15.w),
                  //   child: Text(
                  //     "المنتجات",
                  //     style: Styles.textStyle20
                  //         .copyWith(color: AppColors.kPrimaryColor)
                  //         .copyWith(fontSize: 20),
                  //   ),
                  // ),
                  // ProductsGridView(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  // )
                ]),
          ),
        );
      },
    );
  }
}
