import 'package:flutter/cupertino.dart';

class AlertBox {
  static void alertBox({
    required String title,
    required String content,
    required String buttonText,
    required VoidCallback function,
    required BuildContext context,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoButton(
                child: Text(buttonText),
                onPressed: () {
                  function();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    });
  }
}
