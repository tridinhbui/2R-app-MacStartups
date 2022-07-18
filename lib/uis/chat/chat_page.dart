import 'package:flutter/material.dart';

import '../../utils/app_size.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late AppSize appSize;
  bool isChat = false;
  TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    appSize = AppSize(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        title: Text("Scrap Collector"),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.video_call),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/Tri.jpeg')),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 320,
                        ),
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("Hello, are you coming now? I have something to do in the next 30 minute"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 320,
                          ),
                          padding: EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Yes just few minutes"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/scrap_ava.jpeg')),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/Tri.jpeg')),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 320,
                        ),
                        padding: EdgeInsets.all(17),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text("find the red house at the end of the street"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 320,
                          ),
                          padding: EdgeInsets.all(17),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("sure, tks"),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(radius: 35, backgroundImage: AssetImage('assets/images/scrap_ava.jpeg')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              alignment: Alignment.topCenter,
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: appSize.getWidth(20),
                  vertical: appSize.getHeight(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      height: appSize.height * 0.045,
                      width: appSize.width * 0.4,
                      child: Row(
                        children: [
                          SizedBox(
                            width: appSize.width * 0.03,
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(),
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                onTap: () {
                                  isChat == true;
                                  setState(() {});
                                },
                                textInputAction: TextInputAction.search,
                                decoration: const InputDecoration.collapsed(
                                  hintText: "Aa",
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none,
                                ),
                                controller: chatController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
