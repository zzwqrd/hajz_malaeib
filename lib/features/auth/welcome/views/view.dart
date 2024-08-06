import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/helpers/custom_btn.dart';
import '../../../../core/utils/helpers/route.dart';
import '../../../../core/utils/helpers/theme.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/locale_keys.g.dart';
import 'view_model/controller.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          Assets.iconsPngwing, // Add your logo image to assets
                          height: 100,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset(
                  Assets.iconsS, // Add your stadium image to assets
                  height: 200.w,
                ),
              ],
            ),
          ),
          StylesApp.instance.height,
          // Arabic Text
          Text(
            tr(LocaleKeys.welcome),
            style: StylesApp.instance.appStyle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          StylesApp.instance.height,
          Text(
            tr(LocaleKeys.sub_welcome),
            style: StylesApp.instance.appStyle,
          ),
          const SizedBox(height: 40),
          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {},
                        text: tr(LocaleKeys.login),
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: () {},
                        text: tr(LocaleKeys.register),
                      ),
                    ),
                  ],
                ),
                StylesApp.instance.height,
                CustomElevatedButton(
                  hasBorder: true,
                  onPressed: () {
                    pushAndRemoveUntil(
                      NamedRoutes.i.navigationView,
                    );
                  },
                  text: tr(LocaleKeys.guest),
                ),
              ],
            ),
          ),
          StylesApp.instance.height,
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: BlocBuilder(
                bloc: KiwiContainer().resolve<LanguageCubit>(),
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      final cubit = KiwiContainer().resolve<LanguageCubit>();
                      cubit.changeLanguage(context);
                    },
                    child: Text(
                      tr(LocaleKeys.change_language),
                      style: StylesApp.instance.appStyle,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
