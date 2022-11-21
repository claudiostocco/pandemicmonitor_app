import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool?> alertBase({
  required BuildContext context,
  required String title,
  required String msg,
  required AlertType type,
  required List<DialogButton> buttons,
}) {
  return Alert(
    context: context,
    title: title,
    desc: msg,
    type: type,
    style: AlertStyle(backgroundColor: Colors.grey.shade200),
    buttons: buttons,
  ).show();
}

Future<bool?> alertError({
  required BuildContext context,
  required String title,
  required String msg,
}) {
  return alertBase(
    context: context,
    title: title,
    msg: msg,
    type: AlertType.error,
    buttons: [
      DialogButton(
        child: const Text('OK'),
        color: Colors.blue.shade900,
        onPressed: () => Navigator.pop(context),
      )
    ],
  );
}

Future<bool?> alertSuccess({
  required BuildContext context,
  required String title,
  required String msg,
}) {
  return alertBase(
    context: context,
    title: title,
    msg: msg,
    type: AlertType.success,
    buttons: [
      DialogButton(
        child: const Text('OK'),
        color: Colors.blue.shade900,
        onPressed: () => Navigator.pop(context),
      )
    ],
  );
}
