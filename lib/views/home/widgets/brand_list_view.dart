import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/views/productsOfBrands/products_of_brands_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../blocs/brand/brand_cubit.dart';
import 'brand_item.dart';

class BrandListView extends StatelessWidget {
  const BrandListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandCubit, BrandState>(
        listener: (context, state) {},
        builder: (context, state) {
          var brandCubit=BrandCubit.get(context);
          return SizedBox(
            height: 130.h,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:
                brandCubit.brandModel?.data?.data?.original?.data?.length??0,
                itemBuilder: (context, index) => BrandItem(
                  onTap: () {
                    AppNavigator.customNavigator(context: context, screen: ProductsOfBrandsView(id: brandCubit.brandModel!.data!.data!.original!.data![index].id!), finish: false);
                  },
                  name: brandCubit
                      .brandModel?.data?.data?.original?.data?[index].name??'',
                  image:brandCubit
                      .brandModel?.data?.data?.original?.data?[index].image??'',
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 10.w,
                )),
          );
        });
  }
}
