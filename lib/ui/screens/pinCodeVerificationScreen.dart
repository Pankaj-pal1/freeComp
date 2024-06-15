import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

import '../../utils/common_textstyles.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  const PinCodeVerificationScreen({
    Key? key,
    this.phoneNumber,
  }) : super(key: key);

  final String? phoneNumber;

  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController otpController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    otpController.dispose();
    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Welcome back, Priya.",
              style: whiteTextStyleBWhite24(),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Enter the 6-digit code sent to you at 8700604679.",
              style: whiteTextStyleBWhite12(),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              child: Text(
                "Changed Your mobile number?",
                style: whiteTextStyleBWhite12(),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: GoogleFonts.lato(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: true,
                  obscuringWidget: Text(
                    "*",
                    style: blackTextStyleBlack20(),
                  ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  // validator: (v) {
                  //   if (v!.length < 3) {
                  //     return "I'm from validator";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Colors.white,
                    activeFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Didn't receive the code? ",
                  style: whiteTextStyleBWhite12(),
                ),
                TextButton(
                  onPressed: () => snackBar("OTP resend!!"),
                  child: Text(
                    "Resend",
                    style: whiteTextStyleBWhite12(),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    height: 5.h,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 1.h,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    formKey.currentState!.validate();
                    // conditions for validating
                    if (currentText.length != 6 || currentText != "123456") {
                      errorController!.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() => hasError = true);
                    } else {
                      setState(
                        () {
                          hasError = false;
                          snackBar("OTP Verified!!");
                        },
                      );
                    }
                    hasError
                        ? toastification.show(
                            type: ToastificationType.success,
                            style: ToastificationStyle.flat,
                            autoCloseDuration: const Duration(seconds: 3),
                            description: RichText(
                              text: TextSpan(
                                text: 'Please fill up all the cells properly',
                                style: greyTextStyleBlack16(),
                              ),
                            ),
                            alignment: Alignment.topRight,
                            direction: TextDirection.ltr,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            animationBuilder:
                                (context, animation, alignment, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            icon: const Icon(Icons.check),
                            primaryColor: Colors.green,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x07000000),
                                blurRadius: 16,
                                offset: Offset(0, 16),
                                spreadRadius: 0,
                              )
                            ],
                            showProgressBar: true,
                            closeButtonShowType: CloseButtonShowType.onHover,
                            closeOnClick: false,
                            pauseOnHover: true,
                            dragToClose: true,
                            applyBlurEffect: true,
                            callbacks: ToastificationCallbacks(
                              onTap: (toastItem) =>
                                  print('Toast ${toastItem.id} tapped'),
                              onCloseButtonTap: (toastItem) => print(
                                  'Toast ${toastItem.id} close button tapped'),
                              onAutoCompleteCompleted: (toastItem) => print(
                                  'Toast ${toastItem.id} auto complete completed'),
                              onDismissed: (toastItem) =>
                                  print('Toast ${toastItem.id} dismissed'),
                            ),
                          )
                        : "";
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    height: 5.h,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 1.h,
                        ),
                        child: Row(
                          children: [
                            Text("Next", style: whiteButtonTextStyle()),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
