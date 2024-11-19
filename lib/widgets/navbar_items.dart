import 'package:flutter/material.dart';

class NavbarItems extends StatelessWidget {
  final String text;
  final String route;
  const NavbarItems({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/$route'),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
