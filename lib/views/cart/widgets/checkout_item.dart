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

class CheckOutItem extends StatelessWidget {
  const CheckOutItem({Key? key, required this.cartItem}) : super(key: key);

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
            width: 80.w,
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 15.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.itemProductName.toString(),
                    style: Styles.textStyle20,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(cartItem.itemQuantity.toString(),style: Styles.textStyle18,),
                  Text(cartItem.itemTotal.toString(),style: Styles.textStyle20.copyWith(color: AppColors.kPrimaryColor),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
