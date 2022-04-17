import 'package:chatapp/Model/chat_model.dart';
import 'package:chatapp/customUi/custom_card.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "John Doe",
      icon: "assets/person.svg",
      isGroup: false,
      time: "12:30",
      currentMessage: "This is a subtitle",
    ),
    ChatModel(
      name: "David Doe",
      icon: "assets/person.svg",
      isGroup: false,
      time: "3:30",
      currentMessage: "Hi everyone",
    ),
    ChatModel(
      name: "Learn Together",
      icon: "assets/groups.svg",
      isGroup: true,
      time: "4:10",
      currentMessage: "Hi everyone",
    ),
    ChatModel(
      name: "James Doe",
      icon: "assets/person.svg",
      isGroup: false,
      time: "5:00",
      currentMessage: "Hi , how are you?",
    ),
    ChatModel(
      name: "ALCANDR",
      icon: "assets/groups.svg",
      isGroup: true,
      time: "5:30",
      currentMessage: "Hi everyone",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CustomCard(
            chat: chats[index],
          );
        },
        itemCount: chats.length,
      ),
    );
  }
}
