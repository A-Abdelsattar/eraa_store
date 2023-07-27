import 'package:cached_network_image/cached_network_image.dart';
import 'package:eraa_store/core/utils/styles.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItem extends StatelessWidget {
  final String image;
  final String name;
  final void Function()? onTap;

  const BrandItem(
      {super.key, required this.image, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.grey[100],
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 150.w,
          height: 130.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl:
                      image,
                  width: 90,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              // Expanded(child: Image.network(image)),
              Padding(
                padding: EdgeInsets.only(bottom: 15.h,left: 10.w,right: 5.w,top: 10.h),
                child: Text(
                  name,
                  style:
                      Styles.textStyle18,
                  overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
