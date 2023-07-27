import 'package:eraa_store/blocs/profile/profile_cubit.dart';
import 'package:eraa_store/core/toast/toast.dart';
import 'package:eraa_store/enums/toast_state.dart';
import 'package:eraa_store/src/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
 const ProfileView({super.key});

  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccessState) {
          ToastConfig.showToast(
              msg: 'تم تعديل البروفايل بنجاح',
              toastStates: ToastStates.success);
        }
      },
      builder: (context, state) {
        var profileCubit = ProfileCubit.get(context);
        return Scaffold(
          body: profileCubit.profileModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 290.h,
                        child: Stack(
                          // fit: StackFit.passthrough,
                          alignment: Alignment.topCenter,
                          children: [
                            CustomPaint(
                              painter: HeaderCurvedContainer(),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20.r),
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(
                                      fontSize: 35.sp,
                                      letterSpacing: 1.5,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                profileCubit.fileImage != null ?
                                Container(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.file(profileCubit.fileImage!,
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width / 2,
                                        height: MediaQuery.of(context).size.width / 2,
                                      ),
                                  ),
                                  // padding: EdgeInsets.all(10.0.r),
                                  width:
                                  MediaQuery.of(context).size.width / 2,
                                  height:
                                  MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 5),
                                    shape: BoxShape.circle,
                                    color: Colors.white,

                                  ),
                                )   :
                                Container(
                                  padding: EdgeInsets.all(10.0.r),
                                  width:
                                      MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 5),
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(profileCubit
                                              .profileModel?.data?.image
                                              .toString() ??
                                          ''),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 190.0.h, left: 150.w),
                              child: CircleAvatar(
                                backgroundColor: Colors.black54,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    profileCubit.uploadOnlyImage();
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30.0.h, horizontal: 20.w),
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_outlined,
                                        size: 30,
                                        color: Colors.white,
                                      ))),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            textForm(profileCubit.emailController, 'email',
                                Icons.email_outlined),
                            textForm(profileCubit.nameController, 'name',
                                Icons.person),
                            textForm(profileCubit.phoneController, 'phone',
                                Icons.phone_android),
                            textForm(profileCubit.addressController,
                                'address', Icons.location_on_outlined),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.kPrimaryColor),
                                onPressed: () {
                                  profileCubit.updateUserData(
                                    // imageNew: profileCubit.fileImage==null ? null : profileCubit.fileImage!.path,
                                  );
                                },
                                child: const Center(
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (state is UpdateUserDataLoadingState)
                              const LinearProgressIndicator()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.kPrimaryColor;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Widget textField({required hintText}) {
  return Material(
    elevation: 4,
    shadowColor: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            letterSpacing: 2,
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
          fillColor: Colors.white30,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none)),
    ),
  );
}

Widget textForm(var controller, String label, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder()),
    ),
  );
}
