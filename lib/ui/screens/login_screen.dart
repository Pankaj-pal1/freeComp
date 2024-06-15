import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Center(child: Image.asset("assets/images/icon_logo_black.png"),),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 4.w),
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
                          borderRadius: const BorderRadius.all(Radius.circular(8))),
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
                    InkWell(
                      onTap: (){
                        toastification.show(
                          type: ToastificationType.success,
                          style: ToastificationStyle.flat,
                          autoCloseDuration: const Duration(seconds: 3),
                          title: Text('Hello, World!'),
                          description: RichText(text: const TextSpan(text: 'This is a sample toast message. ')),
                          alignment: Alignment.topRight,
                          direction: TextDirection.ltr,
                          animationDuration: const Duration(milliseconds: 300),
                          animationBuilder: (context, animation, alignment, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          icon: const Icon(Icons.check),
                          primaryColor: Colors.green,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                            onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
                            onCloseButtonTap: (toastItem) => print('Toast ${toastItem.id} close button tapped'),
                            onAutoCompleteCompleted: (toastItem) => print('Toast ${toastItem.id} auto complete completed'),
                            onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: const BorderRadius.all(Radius.circular(8))),
                        height: 5.h,
                        child: Center(
                          child: Text(
                              "Login",
                              style: blackButtonTextStyle()
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]


      ),
    );
  }
}
