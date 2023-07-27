import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraa_store/core/utils/styles.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:eraa_store/views/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SingleProductView extends StatelessWidget {

  const SingleProductView({super.key, required this.name, required this.image, required this.price, required this.description,});

  final String name;
  final String image;
  final String price;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ' ',style: Styles.textStyle20.copyWith(fontSize: 25.sp),),
        centerTitle: true,
        actions:  [Padding(
          padding: EdgeInsets.all(8.0.r),
          child:const Icon(Icons.shopping_cart),
        )],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
        child: ListView(
          children: [
            CachedNetworkImage(
              imageUrl: image ?? ' ',
              width: double.infinity,
              height: 250.h,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Text(
                  name ?? ' ',
                  style: Styles.textStyle20,
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
                const Spacer(),
                Text(
                  '${price}\$',
                  style: Styles.textStyle18.copyWith(color:AppColors.kPrimaryColor),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Text(
              description ?? '',
              style: Styles.textStyle16.copyWith(fontSize: 20.sp),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: ElevatedButton(
                onPressed: (){},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('اضف الى السله',style: Styles.textStyle16,),
                    SizedBox(width: 15.w,),
                    Icon(Icons.shopping_cart_outlined)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class SingleProductView extends StatefulWidget {
//
//
//   @override
//   _SingleProductViewState createState() => _SingleProductViewState();
// }
//
// class _SingleProductViewState extends State<SingleProductView> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     double height=MediaQuery.of(context).size.height;
//     double width=MediaQuery.of(context).size.height;
//
//
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//
//           Container(
//               height: height,
//               width: width,
//               child: Image.network(sentProduct.location,fit: BoxFit.fill,)),
//
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20,60,20,0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 GestureDetector(child: Icon(Icons.arrow_back_ios),
//                   onTap: (){
//                     Navigator.pop(context);
//                   },
//                 ),
//
//
//                 GestureDetector(
//                     onTap: (){Navigator.pushNamed(context, CartScreen.id);},
//                     child: Icon(Icons.shopping_cart)),
//
//               ],
//             ),
//           ),
//
//
//
//           Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(top: height*0.5),
//
//                 width: width,
//                 height: height*0.5,
//                 color:Colors.white.withOpacity(0.3),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//
//                     Text(sentProduct.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
//                     Text(sentProduct.describtion,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
//                     Text('${sentProduct.price}\$',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         ClipOval(
//
//                           child: Material(
//                             color: kMainColor,
//                             child: GestureDetector(
//
//                               onTap:(){
//
//                                 setState(() {
//                                   _quantity++;
//                                 });
//
//                               },
//                               child: SizedBox(height: 40,width: 40,
//                                 child: Icon(Icons.add),
//
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             child: Text(_quantity.toString(),style: TextStyle(fontSize: 40),)),
//                         ClipOval(
//
//                           child: Material(
//                             color: kMainColor,
//                             child: GestureDetector(
//
//                               onTap:(){
//                                 if(_quantity>0)
//                                 {
//                                   setState(() {
//                                     _quantity--;
//                                   });
//                                 }
//                               },
//                               child: SizedBox(height: 40,width: 40,
//                                 child: Icon(Icons.remove),
//
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//
//
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//
//
//
//           Positioned(
//             bottom: 50,
//             right: 40,
//             child: Builder(
//               builder: (context)=> IconButton(
//                   icon: Icon(
//                     Icons.add_shopping_cart,color: kMainColor,size: 60,),
//                   onPressed:(){
//                     addToCart(sentProduct,context);
//                   }
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//
//
//   }
//
//   addToCart(Product sentProduct,context) {
//
//
//     bool exist=false;
//     CartItem cartItem=Provider.of<CartItem>(context,listen: false);
//     var productsInCart=cartItem.products;
//     for(var product in productsInCart)
//     {
//       if(product.name==sentProduct.name)
//         exist=true;
//     }
//
//     if(exist)
//     {
//       Scaffold.of(context).showSnackBar(
//           SnackBar(
//               content: Text('This Item is Already exist in your cart')));
//     }
//
//     else
//     {
//       sentProduct.quantity=_quantity;
//       cartItem.addProduct(sentProduct);
//       Scaffold.of(context).showSnackBar(
//           SnackBar(
//               content: Text('Added to Cart')));
//     }
//
//   }
//
// }