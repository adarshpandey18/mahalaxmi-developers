import 'package:flutter/material.dart';
import 'package:mahalaxmi_developers/provider/chat_provider.dart';
import 'package:mahalaxmi_developers/widgets/agent_card.dart';
import 'package:provider/provider.dart';

class AgentsMobileScreen extends StatefulWidget {
  const AgentsMobileScreen({super.key});

  @override
  State<AgentsMobileScreen> createState() => _AgentsMobileScreenState();
}

class _AgentsMobileScreenState extends State<AgentsMobileScreen> {
  @override
  void initState() {
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    chatProvider.getAgents();
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
