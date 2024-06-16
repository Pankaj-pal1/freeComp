import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

cutomLoaderWhiteWidget() {
  return Center(
    child: LoadingAnimationWidget.dotsTriangle(
      color: Colors.white,
      size: 3.5.h,
    ),
  );
}

cutomLoaderBlackWidget() {
  return Center(
    child: LoadingAnimationWidget.dotsTriangle(
      color: Colors.black,
      size: 3.5.h,
    ),
  );
}
