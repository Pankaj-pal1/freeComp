import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/common_repo.dart';
import '../../ui/screens/pinCodeVerificationScreen.dart';
import '../../utils/customToasts.dart';

part 'login_bloc_state.dart';
//7232850492
class LoginBlocCubit extends Cubit<LoginBlocState> {
  final CommonRepository apiRepository;

  LoginBlocCubit(this.apiRepository) : super(LoginState(MobileNumber: "", isError: false, isLoading: false));
  String? response;
  TextEditingController mobileNumber = TextEditingController();

  validateMobileNumberAndCallApi(context) async {
    emit(LoginState(MobileNumber: mobileNumber.text, isError: false, isLoading: true));
    if (mobileNumber.text.length == 10) {
      FocusScope.of(context).unfocus();
      response = await apiRepository.userLogin(mobileNumber.text.toString());
      if (response!=null) {
        successToast(data: response!);
        var route = MaterialPageRoute(builder: (context) {
          return PinCodeVerificationScreen(phoneNumber: mobileNumber.text,);
        });
        Navigator.of(context).push(route);
      }
    } else {
      errorToast(data: "Invalid Mobile Number");
    }
    emit(LoginState(MobileNumber: mobileNumber.text, isError: false, isLoading: false));
  }
}
