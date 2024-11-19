import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      final TextStyle? textStyle =
          sizeInfo.deviceScreenType == DeviceScreenType.desktop
              ? Theme.of(context).textTheme.bodyLarge
              : Theme.of(context).textTheme.bodySmall;
      return Row(
        children: [
          const Expanded(child: Divider(thickness: 2)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('OR', style: textStyle),
          ),
          const Expanded(child: Divider(thickness: 2)),
        ],
      );
    });
  }
}
