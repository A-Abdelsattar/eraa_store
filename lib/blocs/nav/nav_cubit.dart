import 'package:bloc/bloc.dart';
import 'package:eraa_store/views/cart/cart_veiw.dart';
import 'package:eraa_store/views/favorite/favorite_view.dart';
import 'package:eraa_store/views/home/home_view.dart';
import 'package:eraa_store/views/products/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());

  static NavCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems=const[
    BottomNavigationBarItem(icon: Icon(Icons.home_filled,),label: 'الرئيسيه'),
    BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits,),label: 'المنتجات'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined,),label: 'المفضله'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),label: 'السله'),
  ];

  List<Widget> screen=const[
    HomeView(),
    ProductsView(),
    FavoriteView(),
    CartView()
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

}

