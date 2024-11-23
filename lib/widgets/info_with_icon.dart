import 'package:flutter/material.dart';

class InfoWithIcon extends StatefulWidget {
  final IconData iconData;
  final String text;
  final VoidCallbackAction function;
  const InfoWithIcon(
      {super.key,
      required this.iconData,
      required this.text,
      required this.function});

  @override
  State<InfoWithIcon> createState() => _InfoWithIconState();
}

class _InfoWithIconState extends State<InfoWithIcon> {
  var isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.iconData),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            widget.function;
          },
          child: MouseRegion(
            onEnter: (event) {
              setState(() {
                isHovering = true;
              });
            },
            onExit: (event) {
              setState(() {
                isHovering = false;
              });
            },
            child: Text(
              widget.text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isHovering
                        ? Theme.of(context).hintColor
                        : Theme.of(context).textTheme.bodyLarge!.color,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
