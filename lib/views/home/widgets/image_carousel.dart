import 'package:carousel_slider/carousel_slider.dart';
import 'package:eraa_store/blocs/slider/slider_cubit.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCarousel extends StatelessWidget {
   const ImageCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SliderCubit,SliderState>(
      listener: (context,state){},
      builder: (context,state) {
        var sliderCubit=SliderCubit.get(context);
        return sliderCubit.sliderModel==null? Container(height:150.h,child: Center(child: CircularProgressIndicator(color: AppColors.kPrimaryColor,))):CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            enlargeCenterPage: !true,
            enableInfiniteScroll: !false,
            initialPage: 2,
            autoPlay: true,
          ),
          items: sliderCubit.sliderModel?.data?.data?.map((item) => Container(
            margin: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 2.w),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
                child: Image.network(item.image??'', fit: BoxFit.cover, width: double.infinity)),
          ))
              .toList()
        );
      }
    );

  }
}
