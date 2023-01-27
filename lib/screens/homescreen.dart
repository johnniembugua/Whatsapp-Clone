import 'package:chatapp/Pages/chat_page.dart';
import 'package:flutter/material.dart';

import '../Model/chat_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.chatmodels,
    required this.sourceChat,
  }) : super(key: key);
  final List<ChatModel> chatmodels;
  final ChatModel sourceChat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Clone'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton<String>(onSelected: (String value) {
            //print(value);
          }, itemBuilder: (context) {
            return const [
              PopupMenuItem(
                child: Text('New group'),
                value: 'New group',
              ),
              PopupMenuItem(
                child: Text('New broadcast'),
                value: 'New broadcast',
              ),
              PopupMenuItem(
                child: Text('WhatsApp Web'),
                value: 'WhatsApp Web',
              ),
              PopupMenuItem(
                child: Text('Starred messages'),
                value: 'Starred messages',
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: 'Settings',
              ),
            ];
          }),
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt_outlined),
            ),
            Tab(
              text: 'CHATS',
            ),
            Tab(
              text: 'STATUS',
            ),
            Tab(
              text: 'CALLS',
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        const Text("Camera"),
        ChatPage(
          chatmodels: widget.chatmodels,
          sourceChat: widget.sourceChat,
        ),
        const Text("Status"),
        const Text("Calls")
      ]),
    );
  }
}
