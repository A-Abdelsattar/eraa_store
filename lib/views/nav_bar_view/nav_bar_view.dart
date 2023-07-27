
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/nav/nav_cubit.dart';
import '../../src/app_colors.dart';


class NavBarView extends StatelessWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavCubit,NavState>(listener: (context,state){},builder: (context,state){
      var cubit=NavCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.white,
        body: cubit.screen[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          unselectedIconTheme:const IconThemeData(
            color: Colors.black38
          ),
          backgroundColor:const Color(0xffF0F1F1),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.kPrimaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);
          },
          items: cubit.bottomItems,
        ),
      );
    } );
  }
}
