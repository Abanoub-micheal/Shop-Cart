import 'package:flutter/material.dart';

import 'my_theme.dart';
class DialogUtils {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          content: Row(
            children: [const CircularProgressIndicator(), Text(message)],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(BuildContext context, String message,
      String posActionText, Function posAction,
      {String? negActionText, Function? negAction, String? title}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(title??''),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    Text(message),
                  ],
                ),
                TextButton(style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(MyTheme.primaryColor)),
                    onPressed: () {
                      posAction(context);
                    },
                    child: Text(posActionText,style: const TextStyle(color: Colors.white),)),
              ],
            )
          ],
        );
      },
    );
  }
}
