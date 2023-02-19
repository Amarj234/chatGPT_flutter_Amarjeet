import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          //   color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: chatIndex == 0
                      ? ChatBubble(
                          alignment: Alignment.topRight,
                          clipper:
                              ChatBubbleClipper3(type: BubbleType.sendBubble),
                          backGroundColor: Color(0xFF244B8A),
                          margin: EdgeInsets.only(left: 50),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.7,
                            ),
                            child: Text(
                              msg.trim(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : DefaultTextStyle(
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                          child: ChatBubble(
                            clipper: ChatBubbleClipper3(
                                type: BubbleType.receiverBubble),
                            backGroundColor: Color(0xffEFEFF4),
                            margin: EdgeInsets.only(top: 20, left: 10),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.7,
                              ),
                              child: Text(
                                msg.trim(),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
