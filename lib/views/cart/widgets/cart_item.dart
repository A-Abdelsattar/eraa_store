import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraa_store/blocs/cart/cart_cubit.dart';
import 'package:eraa_store/core/toast/toast.dart';
import 'package:eraa_store/enums/toast_state.dart';
import 'package:eraa_store/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/styles.dart';
import '../../../src/app_colors.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.cartItem}) : super(key: key);

  final CartItems cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.kPrimarySilverColor, width: 2)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: cartItem.itemProductImage.toString(),
            width: 100.w,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),

          Expanded(
            child: SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.only(right: 15.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartItem.itemProductName.toString(),
                          style: Styles.textStyle20,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        BlocConsumer<CartCubit, CartState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              var cartCubit = CartCubit.get(context);
                              return InkWell(
                                onTap: () {
                                  Widget cancelButton = TextButton(
                                    child:const Text("Cancel"),
                                    onPressed:  () {
                                      Navigator.pop(context);
                                    },
                                  );
                                  Widget okButton = TextButton(
                                    child:const Text("OK"),
                                    onPressed: () {
                                      cartCubit.removeFromCart(id: cartItem.itemId!);
                                      Navigator.pop(context);
                                    },
                                  );
                                  AlertDialog alert = AlertDialog(
                                    title:const Text("Remove item from cart!"),
                                    content:const Text("Are you sure?"),
                                    actions: [
                                      okButton,
                                      cancelButton
                                    ],
                                  );

                                  // show the dialog
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return alert;
                                    },
                                  );
                                },
                                child:const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              );
                            })
                        // Text('${cartItem.itemProductPrice}\$',style: Styles.textStyle16.copyWith(color: AppColors.kPrimaryColor),)
                      ],
                    ),

                    // Padding(
                    //   padding: EdgeInsets.only(bottom: 8.0.h),
                    //   child: Text(
                    //     cartItem.itemTotal.toString(),
                    //     style: Styles.textStyle14
                    //         .copyWith(color: AppColors.kPrimarySilverColor),
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                    BlocConsumer<CartCubit,CartState>(
                      listener: (context,state){},
                      builder: (context,state) {
                        var cartCubit=CartCubit.get(context);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80.w,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.kPrimarySilverColor,
                                      width: 2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // cartItem.itemQuantity++;
                                      cartCubit.upDateCart(cartItem.itemId!,++cartItem.itemQuantity);
                                      // ToastConfig.showToast(msg: 'تم تعديل السله', toastStates: ToastStates.success);

                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                  Text('${cartItem.itemQuantity}'),
                                  InkWell(
                                    onTap: () {
                                      if(cartItem.itemQuantity>1){
                                      // cartItem.itemQuantity--;
                                      cartCubit.upDateCart(cartItem.itemId!,--cartItem.itemQuantity);
                                      // ToastConfig.showToast(msg: 'تم تعديل السله', toastStates: ToastStates.success);

                                      }else{
                                        ToastConfig.showToast(msg: 'يجب ان تكون الكميه اكبر من 0', toastStates: ToastStates.error);
                                      }
                                    },
                                    child: const Icon(Icons.remove),
                                  ),
                                ],
                              ),
                            ),
                            Text('${cartItem.itemTotal}\$',style: Styles.textStyle16.copyWith(color: AppColors.kPrimaryColor),)
                          ],
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
