import 'package:eraa_store/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../blocs/product/product_cubit.dart';
import '../../../core/utils/navigation.dart';
import '../../../src/app_colors.dart';
import '../single_product.dart';

class ProductsGridView extends StatelessWidget {
    ProductsGridView({Key? key }) : super(key: key);
    // bool? shrinkWrap = false;
    // ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    ProductCubit.get(context).getAllProducts();
    return BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var productCubit = ProductCubit.get(context);
          return productCubit.productModel==null
              ? Expanded(
                child: GridView.builder(
            itemCount: 20,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2),
            itemBuilder: (context, index) =>shimmer(),
          ),
              )
              : Expanded(
                  child: GridView.builder(
                    // physics: physics,
                    //   shrinkWrap: shrinkWrap!,
                      itemCount: productCubit.productModel?.data?.data?.original
                              ?.data?.length ??
                          0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.64,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => ProductItem(
                           image: productCubit.productModel?.data?.data?.original
                               ?.data?[index].image??'',
                            price:  productCubit.productModel?.data?.data?.original
                            ?.data?[index].price??'',
                            name:  productCubit.productModel?.data?.data?.original
                            ?.data?[index].name??'',
                            id:  productCubit.productModel?.data?.data?.original
                            ?.data?[index].id??0,
                            category:  productCubit.productModel?.data?.data?.original
                            ?.data?[index].category??'',
                            onTap: () {
                              AppNavigator.customNavigator(
                                  context: context,
                                  screen: SingleProductView(name: productCubit.productModel!.data!.data!.original!.data![index].name!,
                                      price: productCubit.productModel!.data!.data!.original!.data![index].price!,
                                    image: productCubit.productModel!.data!.data!.original!.data![index].image!,
                                    description: productCubit.productModel!.data!.data!.original!.data![index].description!,
                                  ),
                                  finish: false);
                            },
                          ),
                      ),
                );
        });
  }
}

Widget shimmer(){
  return Shimmer.fromColors(child:Container(
    decoration: BoxDecoration(
      // color: Colors.white,
      border: Border.all(width: 2, color: AppColors.kPrimarySilverColor),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Container(
              width: 100.w,
              height: 80.h,
              color: Colors.white,
            ),
          ),
          Container(
            height: 10.h,
            width: 100.w,
            color: Colors.white,
          ),
          Container(
            height: 10.h,
            width: 90.w,
            color: Colors.white,
          ),
          Container(
            height: 10.h,
            width: 50.w,
            color: Colors.white,
          ),
          Container(
            height: 20.h,
            width: 130.w,
            color: Colors.white,
          )
        ],
      ),
    ),
  ) ,
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,);
}