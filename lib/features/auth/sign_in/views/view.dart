import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Image.asset(
              Assets.iconsLogo,
              width: 50.w,
            ),
          ),
        ],
      ),
    );
  }
}
