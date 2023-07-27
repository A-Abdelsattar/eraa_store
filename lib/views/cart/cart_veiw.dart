import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eraa_store/blocs/cart/cart_cubit.dart';
import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/views/cart/checkout_view.dart';
import 'package:eraa_store/views/cart/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/styles.dart';
import '../../src/app_colors.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cartCubit = CartCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "سلة المشتريات",
                style: Styles.textStyle20
                    .copyWith(color: AppColors.kPrimaryColor),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: ConditionalBuilder(
                condition: cartCubit.getCartModel!=null,
                builder: (context)=>ConditionalBuilder(
                    condition: cartCubit.getCartModel!.data!.cartItems!.isNotEmpty,
                    builder: (context)=>Padding(
                        padding: EdgeInsets.all(8.0.r),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CartListView(),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Container(
                                padding: EdgeInsets.all(10.r),
                                width: double.infinity,
                                decoration:
                                const BoxDecoration(color: Colors.black),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'total price: ${cartCubit.getCartModel!.data!.total}',
                                      style: Styles.textStyle18
                                          .copyWith(color: Colors.white),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          AppNavigator.customNavigator(context: context, screen: CheckOutView(), finish: false);
                                        }, child: Text('CheckOut'))
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    fallback: (context)=>  Center(
                      child: Image.network('https://cdn-icons-png.flaticon.com/512/669/669737.png',width: 300.w,),
                    )),
                fallback: (context)=>const  Center(child: CircularProgressIndicator(color: AppColors.kPrimaryColor,))
            ),
          );
        });
  }
}
