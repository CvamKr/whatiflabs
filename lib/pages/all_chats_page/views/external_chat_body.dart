import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatiflabs/services/string_const.dart';
import 'package:whatiflabs/services/widgets/my_cached_network_image.dart';
import 'package:whatiflabs/services/widgets/my_icon_btn.dart';

import '../../../services/widgets/my_text.dart';

class ExternalChatBody extends StatelessWidget {
  const ExternalChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Color(0xffE5E5E5),
        // color: Colors.white,
        child: ChatList());
  }
}

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ChatTemplate(index: index);
      },
    );
  }
}

class ChatTemplate extends StatelessWidget {
  int index;
  ChatTemplate({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        // height: 65,
        decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextAvatar(
                    size: 38,
                    shape: Shape.Circular,
                    // textColor: Colors.white,
                    fontSize: 14,
                    // fontWeight: FontWeight.w600,
                    upperCase: true,
                    // backgroundColor: Colors.black,
                    numberLetters: 2,
                    text: "X",
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Container(
                                    // height: 24,
                                    child: myText(
                                        txt: "XYZ $index",
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    // color: Colors.blue,
                                    child: myText(
                                        txt: "DM’s - 22 . Groups - 3",
                                        fontWeight: FontWeight.w600,
                                        textOverflow: TextOverflow.ellipsis,
                                        color:
                                            Color(0xff1B263B).withOpacity(0.5)),
                                  ),
                                ],
                              ),
                            ),
                            myIconBtn(
                                alignment: Alignment.center,
                                icon: Icons.keyboard_arrow_right,
                                iconColor: Colors.grey,
                                onPressed: () {})
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
