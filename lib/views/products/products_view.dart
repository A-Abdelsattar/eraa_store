
import 'package:eraa_store/core/utils/styles.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:eraa_store/views/products/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("تصفح المنتجات", style: Styles.textStyle20.copyWith(
              color: AppColors.kPrimaryColor,
          ),),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children:  [
              ProductsGridView(),
            ],
          ),
        ),
      ),
    );
  }
}



