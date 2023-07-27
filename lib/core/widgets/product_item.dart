import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraa_store/blocs/cart/cart_cubit.dart';
import 'package:eraa_store/blocs/favorite/favorite_cubit.dart';
import 'package:eraa_store/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../toast/toast.dart';
import '../../enums/toast_state.dart';
import '../../src/app_colors.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    this.onTap,
    required this.name,
    required this.image,
    required this.category,
    required this.price,
    required this.id,
  }) : super(key: key);
  final String name;
  final String image;
  final String category;
  final String price;
  final int id;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: AppColors.kPrimarySilverColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: onTap,
              child: CachedNetworkImage(
                imageUrl: image,
                width: 100.w,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                BlocConsumer<FavoriteCubit, FavoriteState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var favoriteCubit = FavoriteCubit.get(context);
                      return Material(
                        shape: const CircleBorder(),
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {
                            if (favoriteCubit.ids.contains(id)) {
                              favoriteCubit.removeFromFavorite(id: id);
                              ToastConfig.showToast(
                                  msg: 'تم ازالة المنتج من المفضله',
                                  toastStates: ToastStates.error);
                            } else {
                              favoriteCubit.addToFavorite(id: id);
                              ToastConfig.showToast(
                                  msg: 'تم اضافة المنتج الي المفضله',
                                  toastStates: ToastStates.success);
                            }
                          },
                          child:
                          Visibility(
                            visible: favoriteCubit.ids.contains(id),
                            child: Icon(
                              Icons.favorite,
                              size: 30,
                              color: AppColors.kPrimaryRedColor,
                            ),
                            replacement: Icon(
                              Icons.favorite_border_outlined,
                              size: 30,
                            ),
                          ),
                          // favoriteCubit.ids.contains(id)?
                          //     Icon(
                          //       Icons.favorite,
                          //       size: 30,
                          //       color: AppColors.kPrimaryRedColor,
                          //
                          // ):Icon(
                          //   Icons.favorite_border_outlined,
                          //   size: 30,
                          // )
                        ),
                      );
                    }),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                category,
                style: Styles.textStyle16.copyWith(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                maxLines: 1,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$price\$',
                style:
                    Styles.textStyle14.copyWith(color: AppColors.kPrimaryColor),
                overflow: TextOverflow.visible,
                maxLines: 1,
              ),
            ),
            BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cartCubit = CartCubit.get(context);
                  return Material(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10.r),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      onTap: () {
                        cartCubit.addToCart(id: id);
                        ToastConfig.showToast(
                            msg: cartCubit.cartModel?.message ??
                                'تم اضافة المنتج الى سلة',
                            toastStates: ToastStates.success);
                      },
                      child: Container(
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.add_shopping_cart,
                                size: 20.r,
                              ),
                              Text('Add To Cart',
                                  style: Styles.textStyle16
                                      .copyWith(fontWeight: FontWeight.w900))
                            ],
                          )),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
