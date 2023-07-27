import 'package:eraa_store/blocs/favorite/favorite_cubit.dart';
import 'package:eraa_store/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/product/product_cubit.dart';
import '../../../src/app_colors.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit,FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          var favoriteCubit = FavoriteCubit.get(context);
          return state is GetProductsLoadingState
              ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.kPrimaryColor,
              ))
              : Expanded(
              child: GridView.builder(
                  itemCount: favoriteCubit.getFavorite?.data?.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.64,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) =>
                      ProductItem(image: favoriteCubit.getFavorite?.data?[index].image??'',
                        name:  favoriteCubit.getFavorite?.data?[index].name ??'',
                        price:  favoriteCubit.getFavorite?.data?[index].price??'',
                        id: favoriteCubit.getFavorite?.data?[index].id??0, category:'',
                      )
          ));
        });
  }
}
