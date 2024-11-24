import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/chat/agents_desktop.dart';
import 'package:mahalaxmi_developers/screen/chat/agents_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const AgentsMobileScreen(),
      desktop: (context) => const AgentsDesktopScreen(),
    );
  }
}
