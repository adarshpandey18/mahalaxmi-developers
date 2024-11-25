import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/auth_provider.dart';
import 'package:mahalaxmi_developers/provider/chat_provider.dart';
import 'package:mahalaxmi_developers/widgets/agent_card.dart';
import 'package:mahalaxmi_developers/widgets/logo_widget.dart';
import 'package:mahalaxmi_developers/widgets/navbar_items.dart';
import 'package:provider/provider.dart';

class AgentsDesktopScreen extends StatefulWidget {
  const AgentsDesktopScreen({super.key});

  @override
  _AgentsDesktopScreenState createState() => _AgentsDesktopScreenState();
}

class _AgentsDesktopScreenState extends State<AgentsDesktopScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch agents if not already fetched
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    if (chatProvider.getAgentList().isEmpty && !chatProvider.isLoading) {
      chatProvider.getAgents();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/home'),
                  child: const LogoWidget(),
                ),
                const Expanded(
                  flex: 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NavbarItems(
                          text: 'Home', route: 'home', currentPage: 'Agents'),
                      NavbarItems(
                          text: 'Categories',
                          route: 'categories',
                          currentPage: 'Agents'),
                      NavbarItems(
                          text: 'Agents',
                          route: 'agents',
                          currentPage: 'Agents'),
                      NavbarItems(
                          text: 'About', route: 'about', currentPage: 'Agents'),
                      NavbarItems(
                          text: 'Contact',
                          route: 'contact',
                          currentPage: 'Agents'),
                    ],
                  ),
                ),
                CupertinoButton(
                  onPressed: () => authProvider.signOut(context: context),
                  minSize: 33,
                  color: Theme.of(context).highlightColor,
                  child: Text('Sign Out',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            ),
            const SizedBox(height: 75),
            // Check loading state and display accordingly
            chatProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 40,
                      ),
                      itemCount: chatProvider.getAgentList().length,
                      itemBuilder: (context, index) {
                        final agent = chatProvider.getAgentList()[index];
                        return AgentCard(agent: agent);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
