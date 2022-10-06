import 'package:chatapp/Model/chat_model.dart';
import 'package:chatapp/customUi/custom_card.dart';
import 'package:flutter/material.dart';

import '../screens/select_contact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    Key? key,
    required this.chatmodels,
    required this.sourceChat,
  }) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourceChat;
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SelectContact();
          }));
        },
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CustomCard(
            sourceChat: widget.sourceChat,
            chat: widget.chatmodels[index],
          );
        },
        itemCount: widget.chatmodels.length,
      ),
    );
  }
}
