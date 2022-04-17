import 'package:chatapp/Model/chat_model.dart';
import 'package:chatapp/customUi/button_card.dart';
import 'package:chatapp/customUi/contact_card.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contactList = [
      ChatModel(
        name: "John Doe",
        status: "God is merciful",
      ),
      ChatModel(
        name: "James Doe",
        status: "God is merciful",
      ),
      ChatModel(
        name: "Lucy Doe",
        status: "God is merciful",
      ),
      ChatModel(
        name: "Mary Doe",
        status: "God is merciful",
      ),
      ChatModel(
        name: "Henry Doe",
        status: "Flutter developer",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "265 Contacts",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 26,
            ),
            onPressed: () {},
          ),
          PopupMenuButton(
              padding: EdgeInsets.all(0),
              onSelected: ((value) {
                print(value);
              }),
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    child: Text("Invite a Friend"),
                    value: "Invite a Friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contacts"),
                    value: 'Contacts',
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: 'Refresh',
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: 'Help',
                  ),
                ];
              }),
        ],
      ),
      body: ListView.builder(
          itemBuilder: ((context, index) {
            var details = contactList[index];
            if (index == 0) {
              return const ButtonCard(
                icon: Icons.group,
                name: "New group",
              );
            } else if (index == 1) {
              return const ButtonCard(
                icon: Icons.person_add,
                name: "Add Contact",
              );
            }
            return ContactCard(contact: contactList[index]);
          }),
          itemCount: contactList.length),
    );
  }
}
