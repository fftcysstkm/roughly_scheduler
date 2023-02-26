import 'package:flutter/material.dart';

Future<void> dialogBuilder(
    {required BuildContext context,
    required String title,
    required String content,
    required String okText,
    required String cancelText,
    required Function okAction,
    required Function cancelAction}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            // キャンセルボタン押下時の処理
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                cancelAction();
              },
              child: Text(cancelText),
            ),
            // OKボタン押下時の処理
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                okAction();
              },
              child: Text(okText),
            ),
          ],
        );
      });
}
