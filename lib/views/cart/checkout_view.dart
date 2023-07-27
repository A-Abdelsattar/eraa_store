import 'package:eraa_store/core/toast/toast.dart';
import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/enums/toast_state.dart';
import 'package:eraa_store/views/cart/widgets/checkout_list_view.dart';
import 'package:eraa_store/views/nav_bar_view/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/cart/cart_cubit.dart';
import '../../core/utils/styles.dart';
import '../../src/app_colors.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({Key? key}) : super(key: key);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  @override
  void initState() {
    CartCubit.get(context).getChekOut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if(state is OrderSuccessState){
            CartCubit.get(context).getCart();
            ToastConfig.showToast(msg: 'order done', toastStates: ToastStates.success);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var checkOut = CartCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                "Check out",
                style:
                    Styles.textStyle20.copyWith(color: AppColors.kPrimaryColor),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.r),
              child: checkOut.checkOutModel == null
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.kPrimaryColor,
                    ))
                  : Stack(
                      children: [
                        ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textForm(
                                checkOut.nameController, 'name', Icons.person),
                            textForm(
                                checkOut.phoneController, 'phone', Icons.phone),
                            textForm(checkOut.addressController, 'address',
                                Icons.location_on_outlined),
                            textForm(checkOut.cityController, 'city',
                                Icons.location_city),
                            Divider(
                              thickness: 2,
                            ),
                            CheckOutListView(),
                            SizedBox(
                              height: 100.h,
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 15.0.h),
                            child: Container(
                              padding: EdgeInsets.all(10.r),
                              width: double.infinity,
                              decoration:
                                  const BoxDecoration(color: Colors.black),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'total price: ${checkOut.checkOutModel!.data!.total}',
                                    style: Styles.textStyle18
                                        .copyWith(color: Colors.white),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        checkOut.order();
                                      },
                                      child:state is OrderLoadingState?CircularProgressIndicator(): Text('order Now!'))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }
}

Widget textForm(var controller, String label, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder()),
    ),
  );
}
