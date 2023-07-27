import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/views/productsOfBrands/products_of_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/category/category_cubit.dart';
import 'brand_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit,CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var categoryCubit=CategoryCubit.get(context);
          return SizedBox(
            height: 130.h,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:
                categoryCubit.categoryModel?.data?.data?.original?.data?.length??0,
                itemBuilder: (context, index) => BrandItem(
                  onTap: () {
                    AppNavigator.customNavigator(context: context, screen: ProductsOfCategoryView(id: categoryCubit.categoryModel!.data!.data!.original!.data![index].id!), finish: false);
                  },
                  name: categoryCubit
                      .categoryModel?.data?.data?.original?.data?[index].name??'',
                  image:categoryCubit
                      .categoryModel?.data?.data?.original?.data?[index].image??'',
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 10.w,
                )),
          );
        });
  }
}
