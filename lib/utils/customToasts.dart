import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

import 'common_textstyles.dart';

 successToast({required String data}) {
  return toastification.showCustom(
    autoCloseDuration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.horizontal,
    alignment: Alignment.topRight,
    builder: (BuildContext context, ToastificationItem holder) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border(top: BorderSide(color: Colors.green, width: 5)),
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(8),
        height: 8.5.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Success",
                    style: ToastHeadingSuccessStyle(),
                  ),
                  Text(
                    data.length > 50 ? '${data.substring(0, 45)}....' : data,
                    style: ToastSubHeadingStyle(),
                  ),
                ],
              ),
              Icon(
                Icons.close,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    },
  );
}

errorToast({required String data}) {
  return toastification.showCustom(
    autoCloseDuration: const Duration(seconds: 3),
    dismissDirection: DismissDirection.horizontal,
    alignment: Alignment.topRight,
    builder: (BuildContext context, ToastificationItem holder) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border(top: BorderSide(color: Colors.red, width: 5)),
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(8),
        height: 8.5.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_sharp,
                color: Colors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Error",
                    style: ToastHeadingErrorStyle(),
                  ),
                  Text(
                    data.length > 50 ? '${data.substring(0, 45)}....' : data,
                    style: ToastSubHeadingStyle(),
                  ),
                ],
              ),
              Icon(
                Icons.close,
                color: Colors.black,
              ),
            ],
          ),
        ),
      );
    },
  );
}
