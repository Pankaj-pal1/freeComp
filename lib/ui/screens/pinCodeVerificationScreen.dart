import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freecomp/bloc/login_bloc/login_bloc_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../bloc/otp_verification_bloc/otp_verification_cubit.dart';
import '../../data/services/get_it_service.dart';
import '../../utils/common_textstyles.dart';
import '../widgets/loadingWidget.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  const PinCodeVerificationScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: BlocBuilder<OtpVerificationCubit, OtpVerificationState>(
            builder: (BuildContext context, state) {
              if (state is OtpVerificationInitial) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Welcome  ",
                              style: GoogleFonts.lato(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900)),
                          TextSpan(
                            text: "+91-${widget.phoneNumber}",
                            style: whiteTextStyleBWhite24(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Enter the 6-digit code sent to you.",
                      style: whiteTextStyleBWhite12(),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Text(
                          "Changed your mobile number?",
                          style: whiteTextStyleBWhite12(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: PinFieldAutoFill(
                        controller: getIt<OtpVerificationCubit>().loginOtp,
                        enabled: true,
                        cursor: Cursor(
                          width: 2,
                          height: 3.h,
                          color: Colors.black,
                          radius: const Radius.circular(1),
                          enabled: true,
                        ),
                        enableInteractiveSelection: true,
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: false,
                        ),
                        codeLength: 6,
                        autoFocus: true,
                        decoration: BoxLooseDecoration(
                          radius: const Radius.circular(8),
                          textStyle: GoogleFonts.lato(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                          ),
                          gapSpace: 25.w,
                          strokeColorBuilder:
                              PinListenColorBuilder(Colors.black, Colors.black),
                          bgColorBuilder: FixedColorBuilder(Colors.white),
                          strokeWidth: 1.2,
                        ),
                        onCodeChanged: (code) {
                          if (code!.length == 6) {
                            getIt<OtpVerificationCubit>().validateOtp(context, widget.phoneNumber);
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Didn't receive the code? ",
                          style: whiteTextStyleBWhite12(),
                        ),
                        TextButton(
                          onPressed: () {
                            getIt<LoginBlocCubit>().validateMobileNumberAndCallApi(context);
                          },
                          child: Text(
                            "Resend",
                            style: whiteTextStyleBWhite12(),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        getIt<OtpVerificationCubit>()
                            .validateOtp(context, widget.phoneNumber);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8))),
                        height: 5.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: state.isLoading
                                ? cutomLoaderBlackWidget()
                                : Text("Next", style: BlackButtonTextStyle()),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}
