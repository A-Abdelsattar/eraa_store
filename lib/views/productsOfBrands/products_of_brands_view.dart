
import 'package:eraa_store/blocs/brand/brand_cubit.dart';
import 'package:eraa_store/core/utils/styles.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:eraa_store/views/products/widgets/products_grid_view.dart';
import 'package:eraa_store/views/productsOfBrands/widgets/products_of_brands_grid_view.dart';
import 'package:flutter/material.dart';

class ProductsOfBrandsView extends StatefulWidget {
  const ProductsOfBrandsView({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<ProductsOfBrandsView> createState() => _ProductsOfBrandsViewState();
}

class _ProductsOfBrandsViewState extends State<ProductsOfBrandsView> {
  @override
  void initState() {
    BrandCubit.get(context).getProductsOfBrand(widget.id);
    super.initState();
  }
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
            children:const [

              ProductsOfBrandsGridView()
            ],
          ),
        ),
      ),
    );
  }
}



