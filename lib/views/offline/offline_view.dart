import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OfflineView extends StatelessWidget {
  const OfflineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Text('Check your Internet Connection!',style: TextStyle(
            color: Colors.red,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold
          ),),
           SizedBox(
             height: 30.h,
           ),
          Icon(Icons.warning,color: Colors.red,size: 100.r,),
          Container(
            width: double.infinity,
            height: 350.h,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/offline.jpg')
              )
            ),
          ),
         const CircularProgressIndicator()
        ],
      ),
    );
  }
}
