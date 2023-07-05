import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../src/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final bool edit;
  final IconData icon;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.label,
      this.isPassword = false,
      this.edit = true,
      required this.controller,
      required this.icon,});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return '${widget.label} must not be empty';
          }
        },
        enabled: widget.edit,
        controller: widget.controller,
        keyboardType: widget.edit
            ? !widget.isPassword
                ? TextInputType.emailAddress
                : TextInputType.name
            : TextInputType.none,
        decoration: InputDecoration(
            focusedBorder:const OutlineInputBorder(
              borderSide:
                   BorderSide(color: AppColors.kPrimaryColor, width: 2.0),
            ),
            prefixIcon: Icon(
              widget.icon,
              color: AppColors.kPrimaryColor,
            ),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    child: showPassword
                        ?const Icon(
                            Icons.visibility_off,
                            color: AppColors.kPrimaryColor,
                          )
                        : const Icon(
                            Icons.visibility,
                        color: AppColors.kPrimaryColor
                          ))
                :const Text(''),
            border:const OutlineInputBorder(),
            label: Text(
              widget.label,
              style:const TextStyle(color: AppColors.kPrimaryColor),
            )),
        cursorColor: AppColors.kPrimaryColor,
        cursorHeight: 25.h,
        cursorWidth: 3.w,
        cursorRadius:const Radius.circular(20),
        obscureText: widget.isPassword && showPassword,
      ),
    );
  }
}
