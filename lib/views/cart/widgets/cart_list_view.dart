import 'package:eraa_store/blocs/cart/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/app_colors.dart';
import 'cart_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit,CartState>(
      listener: (context,state){},
      builder: (context,state) {
        var cartCubit = CartCubit.get(context);
        return state is GetCartLoadingState
            ? const Expanded(
          child:  Center(
              child: CircularProgressIndicator(
                color: AppColors.kPrimaryColor,
              )),
        )
            :
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CartItem(
                  cartItem: cartCubit
                      .getCartModel!.data!.cartItems![index],
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(
                      height: 10.h,
                    ),
                itemCount: cartCubit
                    .getCartModel?.data?.cartItems?.length ??
                    0));
      }
    );
  }
}
