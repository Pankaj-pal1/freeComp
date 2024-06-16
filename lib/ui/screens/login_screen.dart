import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';
import '../../bloc/login_bloc/login_bloc_cubit.dart';
import '../../data/services/get_it_service.dart';
import '../../utils/common_textstyles.dart';
import '../../utils/customToasts.dart';
import '../../utils/custominputDecoration.dart';
import '../widgets/loadingWidget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<LoginBlocCubit, LoginBlocState>(
          builder: (BuildContext context, state) {
            if (state is LoginState) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset("assets/images/icon_logo_black.png"),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Login or Signup",
                                style: TextStyle18Bold(),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                width: 105.w,
                                padding: EdgeInsets.only(
                                  left: 4.w,
                                  right: 4.w,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: TextFormField(
                                  maxLength: 10,
                                    controller:
                                        getIt<LoginBlocCubit>().mobileNumber,
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.phone,
                                    style: TextFieldTextStyle(),
                                    decoration: getTextFieldDecorationStyle(
                                        "+91  ",
                                        "Enter your mobile number",
                                        "")),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              InkWell(
                                onTap: () {
                                  getIt<LoginBlocCubit>()
                                      .validateMobileNumberAndCallApi();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  height: 5.h,
                                  child: Center(
                                    child: state.isLoading
                                        ? cutomLoaderWidget()
                                        : Text("Login",
                                            style: ButtonTextStyle()),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]);
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
