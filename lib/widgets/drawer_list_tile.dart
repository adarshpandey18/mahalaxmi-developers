import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? iconData;
  final bool changeColor;
  const DrawerListTile(
      {super.key,
      required this.text,
      required this.onTap,
      required this.iconData,
      required this.changeColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        text,
      ),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: changeColor
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).primaryColor,
          ),
      leading: Icon(
        iconData,
        color: changeColor
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
      ),
      tileColor: changeColor
          ? Theme.of(context).primaryColor
          : Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
