import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraa_store/blocs/profile/profile_cubit.dart';
import 'package:eraa_store/core/utils/navigation.dart';
import 'package:eraa_store/core/utils/styles.dart';
import 'package:eraa_store/services/sp_helper/sp_helper.dart';
import 'package:eraa_store/services/sp_helper/sp_keys.dart';
import 'package:eraa_store/views/about_us_view.dart';
import 'package:eraa_store/views/auth/login_view.dart';
import 'package:eraa_store/views/favorite/favorite_view.dart';
import 'package:eraa_store/views/order/order_history_view.dart';
import 'package:eraa_store/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var profileCubit = ProfileCubit.get(context);
          return Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration:
                      const BoxDecoration(color: AppColors.kPrimaryColor),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 45.r,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80.r),
                          child: CachedNetworkImage(
                            imageUrl:  profileCubit.profileModel?.data?.image ?? '',
                            width: 80.w,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: Text(
                          profileCubit.nameController.text,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                ItemDrawer(
                  name: 'الملف الشخصي',
                  onTap: () {
                    AppNavigator.customNavigator(
                        context: context, screen: ProfileView(), finish: false);
                  }, iconData: Icon(Icons.person),
                ),
                ItemDrawer(
                  name: 'طلباتي',
                  onTap: () {
                    AppNavigator.customNavigator(context: context, screen: OrderHistoryScreen(), finish: false);
                    }, iconData: Icon(Icons.production_quantity_limits),
                ),
                ItemDrawer(
                  name: 'المفضله',
                  onTap: () {
                    AppNavigator.customNavigator(context: context, screen: FavoriteView(), finish: false);
                    }, iconData: Icon(Icons.favorite_border),
                ),
                ItemDrawer(
                  name: 'من نحن',
                  onTap: () {
                    AppNavigator.customNavigator(context: context, screen: AboutUsScreen(), finish: false);
                    }, iconData: Icon(Icons.group),
                ),
                ItemDrawer(
                  name: 'الشروط والاحكام',
                  onTap: () {
                    }, iconData: Icon(Icons.offline_bolt_outlined),
                ),
                ItemDrawer(name: 'تسجيل الخروج',onTap: (){
                  SharedPreferenceHelper.removeData(
                      key: SharedPreferencesKeys.token);
                  AppNavigator.customNavigator(
                      context: context, screen: LoginView(), finish: true);

                }, iconData: Icon(Icons.logout,color: AppColors.kPrimaryRedColor,),)
              ],
            ),
          );
        });
  }
}

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({Key? key, required this.name, this.onTap, required this.iconData})
      : super(key: key);
  final String name;
  final void Function()? onTap;
  final Widget? iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
          horizontalTitleGap: 0,
          iconColor: Colors.grey,
          leading:  iconData,
          title: Text(
            name,
            style: Styles.textStyle18.copyWith(color: Colors.grey[500]),
          ),
          onTap: onTap,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: const Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}



