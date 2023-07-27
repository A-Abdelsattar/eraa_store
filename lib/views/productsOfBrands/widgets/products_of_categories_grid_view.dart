import 'package:eraa_store/blocs/category/category_cubit.dart';
import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/views/products/single_product.dart';
import 'package:eraa_store/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../src/app_colors.dart';

class ProductsOfCategoriesGridView extends StatelessWidget {
  const ProductsOfCategoriesGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var categoryCubit = CategoryCubit.get(context);
          return state is GetProductsOfCategoryLoadingState
              ? const Expanded(
                  child: Center(
                      child: CircularProgressIndicator(
                    color: AppColors.kPrimaryColor,
                  )),
                )
              : Expanded(
                  child: GridView.builder(
                    itemCount: categoryCubit
                            .productsOfCategory?.data?.products?.length ??
                        2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.64,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => ProductItem(
                      name: categoryCubit.productsOfCategory?.data
                              ?.products?[index].productName ??
                          '',
                      image: categoryCubit.productsOfCategory?.data
                              ?.products?[index].productImage ??
                          '',
                      category: categoryCubit.productsOfCategory?.data
                              ?.products?[index].category ??
                          '',
                      price: categoryCubit.productsOfCategory?.data
                              ?.products?[index].productPrice ??
                          '',
                      id: categoryCubit.productsOfCategory?.data
                              ?.products?[index].productId ??
                          0
                      // ProductCategoryItem(product: categoryCubit.productsOfCategory!.data!.products![index]
                      ,
                      onTap: () {
                        AppNavigator.customNavigator(
                            context: context,
                            screen: SingleProductView(
                                name: categoryCubit.productsOfCategory?.data
                                        ?.products?[index].productName ??
                                    '',
                                image: categoryCubit.productsOfCategory?.data
                                        ?.products?[index].productImage ??
                                    '',
                                price: categoryCubit.productsOfCategory?.data
                                        ?.products?[index].productPrice ??
                                    '',
                                description: categoryCubit
                                        .productsOfCategory
                                        ?.data
                                        ?.products?[index]
                                        .productDescription ??
                                    ''),
                            finish: false);
                      },
                    ),
                  ),
                );
        });
  }
}
