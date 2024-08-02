import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hajz_malaeib/core/utils/helpers/route.dart';
import 'package:hajz_malaeib/core/utils/helpers/theme.dart';

import '../../../generated/locale_keys.g.dart';

void showDialogShared({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: navigator.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(child: Text(title).tr()),
        content: Text(content, textAlign: TextAlign.center).tr(),
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        actionsOverflowAlignment: OverflowBarAlignment.center,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: StylesApp.instance.colorButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(LocaleKeys.cancel).tr(),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: StylesApp.instance.colorButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onConfirm,
            child: Text(LocaleKeys.ok).tr(),
          ),
        ],
      );
    },
  );
}
