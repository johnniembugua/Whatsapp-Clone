import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/chat_model.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chat}) : super(key: key);
  final ChatModel chat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                size: 24,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  widget.chat.icon!,
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chat.name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.5),
                ),
                const Text(
                  "Last seen today at 12.05",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.video_camera_back)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton(onSelected: ((value) {
            print(value);
          }), itemBuilder: (context) {
            return const [
              PopupMenuItem(
                child: Text("View Contact"),
                value: "View Contact",
              ),
              PopupMenuItem(
                child: Text("Media, links, and docs"),
                value: "Media, links, and docs",
              ),
              PopupMenuItem(
                child: Text("Search"),
                value: 'Search',
              ),
              PopupMenuItem(
                child: Text("Wallpaper"),
                value: "Wallpaper",
              ),
              PopupMenuItem(
                child: Text("More"),
                value: "More",
              ),
            ];
          })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: const EdgeInsets.only(
                                left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: TextFormField(
                              controller: _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                      icon: const Icon(Icons.emoji_emotions)),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.attach_file)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.camera_alt))
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.all(5)),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                          right: 5,
                          left: 2,
                        ),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xff128c7e),
                          radius: 25,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic,
                                color: Colors.white,
                              )),
                        ),
                      )
                    ],
                  ),
                  show ? emojiSelect() : Container(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget emojiSelect() {
    return Container(
      height: 200,
      child: EmojiPicker(
        onEmojiSelected: (category, emoji) {
          print(emoji);
          setState(() {
            _controller.text += emoji.emoji;
          });
        },
        onBackspacePressed: () {
          // Backspace-Button tapped logic
          // Remove this line to also remove the button in the UI
        },
        config: Config(
          columns: 8,
          emojiSizeMax: 28 *
              (Platform.isIOS
                  ? 1.30
                  : 1.0), // Issue: https://github.com/flutter/flutter/issues/28894
          verticalSpacing: 0,
          horizontalSpacing: 0,
          initCategory: Category.RECENT,
          bgColor: Colors.white,
          indicatorColor: const Color(0xff128c7e),
          iconColor: Colors.grey,
          iconColorSelected: const Color(0xff128c7e),
          progressIndicatorColor: const Color(0xff128c7e),
          backspaceColor: const Color(0xff128c7e),
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          showRecentsTab: true,
          recentsLimit: 28,
          noRecentsText: "No Recents",
          noRecentsStyle: const TextStyle(fontSize: 20, color: Colors.black26),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.CUPERTINO,
        ),
      ),
    );
  }
}
