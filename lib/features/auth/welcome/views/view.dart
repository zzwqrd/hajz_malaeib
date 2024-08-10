import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      appBar: AppBar(
        title: Image.asset(
          Assets.iconsPngwing, // Add your logo image to assets
          height: 100,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    Image.asset(
                      Assets.iconsS,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
            ),
            StylesApp.instance.paddingHeight,
            // Arabic Text
            Text(
              tr(LocaleKeys.welcome),
              style: StylesApp.instance.appStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            StylesApp.instance.paddingHeight,
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
                      Flexible(
                        child: CustomElevatedButton(
                          onPressed: () {},
                          text: tr(LocaleKeys.register),
                        ),
                      ),
                      Flexible(
                        child: CustomElevatedButton(
                          onPressed: () {
                            push(
                              NamedRoutes.i.signIn,
                              type: NavigatorAnimation.scale,
                            );
                          },
                          text: tr(LocaleKeys.login),
                        ),
                      ),
                    ],
                  ),
                  StylesApp.instance.paddingHeight,
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
            StylesApp.instance.paddingHeight,
            StylesApp.instance.paddingHeight,
            Align(
              alignment: Alignment.bottomCenter,
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
            StylesApp.instance.paddingHeight,
            StylesApp.instance.paddingHeight,
            StylesApp.instance.paddingHeight,
            StylesApp.instance.paddingHeight,
          ],
        ),
      ),
    );
  }
}
