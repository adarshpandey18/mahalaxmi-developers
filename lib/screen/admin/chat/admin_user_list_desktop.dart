import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/chat_provider.dart';
import 'package:mahalaxmi_developers/widgets/agent_card.dart';
import 'package:mahalaxmi_developers/widgets/user_card.dart';
import 'package:provider/provider.dart';

class AdminUserListDesktop extends StatefulWidget {
  const AdminUserListDesktop({super.key});

  @override
  State<AdminUserListDesktop> createState() => _AdminUserListDesktopState();
}

class _AdminUserListDesktopState extends State<AdminUserListDesktop> {
  @override
  void initState() {
    super.initState();
    // Fetch agents if not already fetched
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    if (chatProvider.getUsersLIst().isEmpty && !chatProvider.isLoading) {
      chatProvider.getUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          chatProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 900,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 40,
                    ),
                    itemCount: chatProvider.getUsersLIst().length,
                    itemBuilder: (context, index) {
                      final user = chatProvider.getUsersLIst()[index];
                      return UserCard(user: user);
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
