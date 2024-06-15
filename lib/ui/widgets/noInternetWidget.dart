import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:sizer/sizer.dart';

class NoInternetAnimation extends StatefulWidget {
  const NoInternetAnimation({super.key});

  @override
  State<NoInternetAnimation> createState() => _NoInternetAnimationState();
}

class _NoInternetAnimationState extends State<NoInternetAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200 * _animation.value,
              height: 200 * _animation.value,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Icon(
                  Icons.wifi_off,
                  color: Colors.black,
                  size: 100 * _animation.value,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            const Text(
              'Seems your connection is lost !',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        );
      },
    );
  }
}
