import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/chat_model.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
            radius: 23, backgroundColor: Colors.grey, child: Icon(icon)),
        title: Text(name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ),
    );
  }
}
