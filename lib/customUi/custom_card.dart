import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/chat_model.dart';
import '../screens/individual_chat_page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chat, required this.sourceChat})
      : super(key: key);

  final ChatModel chat;
  final ChatModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IndividualPage(
                          chat: chat,
                          sourceChat: sourceChat,
                        )));
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(
                chat.isGroup == true
                    ? "assets/groups.svg"
                    : "assets/person.svg",
                color: Colors.white,
                height: 37,
                width: 37,
              ),
              backgroundColor: Colors.blueGrey,
            ),
            title: Text(
              chat.name!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all, color: Colors.grey, size: 12),
                const SizedBox(width: 5),
                Text(chat.currentMessage!,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]))
              ],
            ),
            trailing: Text(chat.time!),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20, left: 80),
          child: Divider(
            thickness: 1,
          ),
        )
      ],
    );
  }
}
