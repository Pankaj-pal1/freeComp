import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/buttonstyles.dart';
import '../../utils/common_textstyles.dart';
import '../../utils/custominputDecoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 105.w,
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: TextFormField(
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.phone,
                      style: TextFieldTextStyle(),
                      decoration: getTextFieldDecorationStyle(
                          "+91  ", "Enter your mobile number", "")),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(

                  child: Center(
                    child: Text(
                        "Login",
                        style: ButtonTextStyle()
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
