import 'package:eraa_store/blocs/brand/brand_cubit.dart';
import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/views/products/single_product.dart';
import 'package:eraa_store/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../src/app_colors.dart';

class ProductsOfBrandsGridView extends StatelessWidget {
  const ProductsOfBrandsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrandCubit, BrandState>(
        listener: (context, state) {},
        builder: (context, state) {
          var brandCubit = BrandCubit.get(context);
          return state is GetProductsOfBrandLoadingState
              ? const Expanded(
                child:  Center(
                    child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  )),
              )
              : Expanded(
                  child: GridView.builder(
                      itemCount: brandCubit.productsOfBrand?.data?.products?.length ??
                          2,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.64,
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => ProductItem(name: brandCubit.productsOfBrand!.data!.products![index].productName!,
                          image: brandCubit.productsOfBrand!.data!.products![index].productImage!,
                          category: brandCubit.productsOfBrand!.data!.products![index].category!,
                          price: brandCubit.productsOfBrand!.data!.products![index].productPrice!,
                          id: brandCubit.productsOfBrand!.data!.products![index].productId!,
                          // ProductCategoryItem(product: brandCubit.productsOfBrand!.data!.products![index],
                      onTap: (){
                        AppNavigator.customNavigator(context: context, screen: SingleProductView(name: brandCubit.productsOfBrand!.data!.products![index].productName!,
                            image: brandCubit.productsOfBrand!.data!.products![index].productImage!,
                            price: brandCubit.productsOfBrand!.data!.products![index].productPrice!,
                            description: brandCubit.productsOfBrand!.data!.products![index].productDescription!), finish: false);
                      },
                      )
                      ),
                );
        });
  }
}
