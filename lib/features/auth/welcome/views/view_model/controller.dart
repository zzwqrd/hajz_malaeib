import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/utils/helpers/route.dart';
import '../../../../../core/utils/helpers/show_dialog_shared.dart';
import '../../../../../generated/locale_keys.g.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  void changeLanguage(BuildContext context) {
    final newLocale = context.locale == const Locale('en')
        ? const Locale('ar')
        : const Locale('en');
    showDialogShared(
      context: context,
      title: tr(LocaleKeys.confirm),
      content: tr(LocaleKeys.confirm_language_change),
      onConfirm: () async {
        Navigator.of(context).pop();
        context.setLocale(newLocale);
        await pushAndRemoveUntil(
          NamedRoutes.i.splash,
        );
      },
    );
    emit(newLocale);
  }
}
