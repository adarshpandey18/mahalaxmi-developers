import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/utils/constants/colors/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class IconCard extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onTap;

  const IconCard({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
  });

  @override
  State<IconCard> createState() => _IconCardState();
}

class _IconCardState extends State<IconCard> {
  late ValueNotifier<bool> isHoveringNotifier;

  @override
  void initState() {
    super.initState();
    isHoveringNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    isHoveringNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isDesktop =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop;
        return GestureDetector(
          onTap: widget.onTap,
          child: MouseRegion(
            onEnter: (event) {
              isHoveringNotifier.value = true;
            },
            onExit: (event) {
              isHoveringNotifier.value = false;
            },
            child: ValueListenableBuilder<bool>(
              valueListenable: isHoveringNotifier,
              builder: (context, isHovering, child) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.navyBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        widget.icon,
                        size: isDesktop ? 32 : 24,
                        color: AppColors.blueGray,
                      ),
                      Visibility(
                          visible: isHovering, child: const SizedBox(width: 8)),
                      AnimatedOpacity(
                        opacity: isHovering ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Visibility(
                          visible: isHovering,
                          child: Text(
                            widget.text,
                            style: const TextStyle(
                              color: AppColors.blueGray,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
