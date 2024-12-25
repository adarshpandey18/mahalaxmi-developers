import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';

class CategoryTile extends StatefulWidget {
  const CategoryTile({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
    required this.selectedCategory,
  });

  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  final String selectedCategory;

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHovering = true;
        }),
        onExit: (event) => setState(() {
          isHovering = false;
        }),
        child: Container(
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.title == widget.selectedCategory
                ? Theme.of(context).primaryColorDark
                : isHovering
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).hoverColor,
          ),
          child: Row(
            children: [
              Icon(
                widget.iconData,
                color:
                    isHovering ? AppColors.midnightBlue : AppColors.royalBlue,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontFamily: GoogleFonts.cinzel().fontFamily,
                      color: isHovering
                          ? AppColors.midnightBlue
                          : AppColors.royalBlue,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
