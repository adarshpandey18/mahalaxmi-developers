import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/screen/admin/chat/admin_user_list_desktop.dart';
import 'package:mahalaxmi_developers/screen/admin/chat/admin_user_list_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdminUserList extends StatelessWidget {
  const AdminUserList({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => const AdminUserListMobile(),
      desktop: (context) => const AdminUserListDesktop(),
    );
  }
}
