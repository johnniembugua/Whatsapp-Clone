import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundColor: Colors.grey,
          child: SvgPicture.asset(
            "assets/person.svg",
            color: Colors.white,
            width: 30,
            height: 30,
          ),
        ),
        title: Text(contact.name!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Text(contact.status!,
            style: const TextStyle(
              fontSize: 13,
            )),
      ),
    );
  }
}
