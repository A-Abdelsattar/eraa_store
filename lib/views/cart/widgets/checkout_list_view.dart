import 'package:eraa_store/blocs/cart/cart_cubit.dart';
import 'package:eraa_store/views/cart/widgets/checkout_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/app_colors.dart';
import 'cart_item.dart';

class CheckOutListView extends StatelessWidget {
  const CheckOutListView({Key? key}) : super(key: key);

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
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CheckOutItem(
                cartItem: cartCubit
                    .checkOutModel!.data!.cartItems![index],
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(
                    height: 10.h,
                  ),
              itemCount: cartCubit
                  .checkOutModel?.data?.cartItems?.length ??
                  0);
        }
    );
  }
}
