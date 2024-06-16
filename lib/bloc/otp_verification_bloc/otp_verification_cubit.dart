import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freecomp/utils/customToasts.dart';
import '../../data/repositories/common_repo.dart';
part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  final CommonRepository apiRepository;
  OtpVerificationCubit(this.apiRepository) : super(OtpVerificationInitial(isLoading: false,otp: ""));

  TextEditingController loginOtp = TextEditingController();
  String? response;

  validateOtp(context,String mobileNumber) async{
    emit(OtpVerificationInitial(isLoading: true, otp: loginOtp.text));
    if(loginOtp.text.length==6){
      response = await apiRepository.otpVerificationApiCall(mobileNumber,loginOtp.text.toString());
      if(response!=null){
        successToast(data: response!);
      }
    }else{
      loginOtp.clear();
      errorToast(data: "Please enter 6 digit OTP");
    }
    emit(OtpVerificationInitial(isLoading: false, otp: loginOtp.text));
  }
}
