import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freecomp/data/repositories/api_endPoints.dart';
import 'package:freecomp/utils/customToasts.dart';
import 'package:http/http.dart' as http;

class CommonRepository {
  final _client = http.Client();
  late final _multipartRequest;

  getHeaderOnlyContentType() {
    var headerInfo = {
      "Content-Type": "application/json",
    };
    return headerInfo;
  }

  Future userLogin(String mobileNumber) async {
    try {
      Uri userRegistrationUri = Uri.parse(ApiEndpoints.loginApi);
      var registrationParams = {
        "phone": mobileNumber,
      };
      var apiResponse = await _client.post(userRegistrationUri, body: jsonEncode(registrationParams), headers: getHeaderOnlyContentType());
      printLog("userLogin", apiResponse);
      if (apiResponse.statusCode == 200) {
        return jsonDecode(apiResponse.body)['message'];
      } else {
        errorToast(data: apiResponse.body.toString());
      }
    } catch (_) {
      errorToast(data: _.toString());
    }
  }

  Future otpVerificationApiCall(String mobileNumber,String otp) async {
    try {
      Uri userRegistrationUri = Uri.parse(ApiEndpoints.otpVerificationApi);
      var registrationParams = {
        "phone": mobileNumber,
        "otp": otp
      };
      var apiResponse = await _client.post(userRegistrationUri, body: jsonEncode(registrationParams), headers: getHeaderOnlyContentType());
      printLog("otpVerificationApiCall", apiResponse);
      if (apiResponse.statusCode == 200) {
        return jsonDecode(apiResponse.body)['message'];
      } else {
        errorToast(data: apiResponse.body.toString());
      }
    } catch (_) {
      errorToast(data: _.toString());
    }
  }
}

printLog(apiMethod, apiResponse) {
  if (kDebugMode) {
    print("$apiMethod  ${apiResponse.statusCode}  ${apiResponse.body}"
        "\n***************************************************************************************");
  }
}
