import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthLandingButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback onTap;

  const AuthLandingButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final defaultColor = Theme.of(context)
            .elevatedButtonTheme
            .style
            ?.backgroundColor
            ?.resolve({}) ??
        Theme.of(context).colorScheme.primary;

    return Expanded(
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final textStyle =
              sizingInformation.deviceScreenType == DeviceScreenType.desktop
                  ? Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                      )
                  : Theme.of(context).textTheme.bodyLarge;

          return ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              textStyle: textStyle,
              padding: const EdgeInsets.symmetric(vertical: 18),
              backgroundColor: backgroundColor ?? defaultColor,
            ),
            child: Text(text),
          );
        },
      ),
    );
  }
}
