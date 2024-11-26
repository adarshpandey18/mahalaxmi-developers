import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/chat_provider.dart';
import 'package:mahalaxmi_developers/widgets/user_card.dart';
import 'package:provider/provider.dart';

class AdminUserListMobile extends StatefulWidget {
  const AdminUserListMobile({super.key});

  @override
  State<AdminUserListMobile> createState() => _AdminUserListMobileState();
}

class _AdminUserListMobileState extends State<AdminUserListMobile> {
  @override
  void initState() {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    chatProvider.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AGENTS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            chatProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
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
      ),
    );
  }
}
