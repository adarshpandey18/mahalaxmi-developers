import 'package:flutter/material.dart';

class NavbarItems extends StatefulWidget {
  final String text;
  final String route;
  final String currentPage;
  const NavbarItems(
      {super.key,
      required this.text,
      required this.route,
      required this.currentPage});

  @override
  State<NavbarItems> createState() => _NavbarItemsState();
}

class _NavbarItemsState extends State<NavbarItems> {
  var isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/${widget.route}'),
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
                fontSize: 18,
                color: widget.currentPage == widget.text
                    ? Theme.of(context).primaryColorLight
                    : isHovering
                        ? Theme.of(context).primaryColorLight
                        : Theme.of(context).primaryColor,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
