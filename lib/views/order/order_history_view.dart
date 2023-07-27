import 'package:eraa_store/blocs/order/order_cubit.dart';
import 'package:eraa_store/models/order_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/styles.dart';
import '../../src/app_colors.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit,OrderState>(
        listener: (context, state) {},
        builder: (context, state) {
          var orderHistory = OrderCubit.get(context);
          return Scaffold(
              appBar:AppBar(
                title: Text("طلباتي", style: Styles.textStyle20.copyWith(
                  color: AppColors.kPrimaryColor,
                ),),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: orderHistory.orderHistory?.data?.orders?.length ?? 0,
                      itemBuilder: (context, index) => orderHistoryItem(
                          orderHistory:
                              orderHistory.orderHistory!.data!.orders![index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Divider(thickness: 2),
                          ),
                    ),
                  ),
                ],
              ));
        });
  }
}

class orderHistoryItem extends StatelessWidget {
  const orderHistoryItem({Key? key, required this.orderHistory})
      : super(key: key);
  final Orders orderHistory;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(orderHistory.orderCode ?? ''),
      subtitle: Text(orderHistory.orderDate ?? ''),
      trailing: Text(orderHistory.total ?? ''),

    );
  }
}
