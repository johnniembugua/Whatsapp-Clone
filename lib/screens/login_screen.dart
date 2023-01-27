import 'package:flutter/material.dart';

import '../Model/chat_model.dart';
import '../customUi/button_card.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel? sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Dev Stack",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "assets/person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Kishor",
      isGroup: false,
      currentMessage: "Hi Kishor",
      time: "13:00",
      icon: "assets/person.svg",
      id: 2,
    ),

    ChatModel(
      name: "Collins",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "8:00",
      icon: "assets/person.svg",
      id: 3,
    ),

    ChatModel(
      name: "Balram Rathore",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "assets/person.svg",
      id: 4,
    ),

    // ChatModel(
    //   name: "NodeJs Group",
    //   isGroup: true,
    //   currentMessage: "New NodejS Post",
    //   time: "2:00",
    //   icon: "group.svg",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (contex, index) {
            return GestureDetector(
              onTap: () {
                sourceChat = chatmodels.removeAt(index);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (builder) => HomeScreen(
                //       chatmodels: chatmodels,
                //     ),
                //   ),
                // );
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    chatmodels: chatmodels,
                    sourceChat: sourceChat!,
                  ),
                ));
                //print("Pressed");
                debugPrint("Pressed");
              },
              child: ButtonCard(
                name: chatmodels[index].name!,
                icon: Icons.person,
              ),
            );
          }),
    );
  }
}
