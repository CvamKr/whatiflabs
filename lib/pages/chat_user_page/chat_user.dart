import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:whatiflabs/models/chat_info_model.dart';
import 'package:whatiflabs/services/string_const.dart';
import 'package:whatiflabs/services/widgets/my_cached_network_image.dart';
import 'package:whatiflabs/services/widgets/my_icon_btn.dart';
import 'package:whatiflabs/services/widgets/my_text.dart';
import 'package:whatiflabs/services/widgets/my_text_field.dart';

class ChatUserPage extends StatefulWidget {
  ChatInfoModel chatInfoModel;
  ChatUserPage({Key? key, required this.chatInfoModel}) : super(key: key);

  @override
  State<ChatUserPage> createState() => _ChatUserPageState();
}

class _ChatUserPageState extends State<ChatUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: chatAppBar(),
        body: Column(
          children: <Widget>[
            Expanded(child: MessageList()),
            messageArea(),
          ],
        ));
  }

  PreferredSizeWidget chatAppBar() {
    return AppBar(
      backgroundColor: Color(0xff292742),
      titleSpacing: 0,
      title: Row(
        children: <Widget>[
          MyCachedNetworkImage(
            imageUrl: widget.chatInfoModel.profilePic,
            circleRadius: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              myText(
                  txt: "${widget.chatInfoModel.name}.designer",
                  color: Colors.white),
              SizedBox(
                height: 4,
              ),
              myText(txt: "online", color: Colors.grey.withOpacity(.8)),
            ],
          )
        ],
      ),
      actions: [
        myIconBtn(
            icon: Icons.notification_important_outlined, onPressed: () {}),
        myIconBtn(icon: Icons.call, onPressed: () {}),
        myIconBtn(icon: Icons.more_vert, onPressed: () {}),
      ],
    );
  }

  final ctrlMsg = TextEditingController();
  Widget messageArea() {
    return Row(
      children: [Expanded(child: messageBox()), sendBtn()],
    );
  }

  Widget messageBox() {
    return Container(
        margin: EdgeInsets.fromLTRB(12, 4, 0, 7),
        height: 36,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffF3F6FB),
          // color: Colors.red,
          borderRadius: BorderRadius.circular(33),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: ctrlMsg,
                    decoration: InputDecoration(
                        // suffix: helperIcons(),
                        prefixIcon: Icon(
                          Icons.circle_notifications_rounded,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: "Write here"),
                  ),
                ),
                helperIcons()
              ],
            )));
  }

  Widget sendBtn() {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, left: 5),
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(shape: BoxShape.circle, color: colorPrimary),
        child: myIconBtn(
            alignment: Alignment.center,
            iconColor: Colors.white,
            icon: Icons.send,
            iconSize: 17,
            onPressed: () {
              Map msg = {"msg": ctrlMsg.text, "isSender": true, "pic": ""};

              listMsg.add(msg);
              ctrlMsg.text = "";
              setState(() {});
            }),
      ),
    );
  }

  Widget helperIcons() {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Row(
        children: <Widget>[
          myIconBtn(icon: Icons.attachment_outlined, onPressed: () {}),
          myIconBtn(icon: Icons.camera, onPressed: () {}),
          myIconBtn(icon: Icons.send, onPressed: () {})
        ],
      ),
    );
  }
}

List listMsg = [
  {"msg": "Hi Deepak, how are you", "isSender": false, "pic": ""},
  {"msg": "Hey Shri, I am fine", "isSender": true, "pic": ""},
  {
    "msg": "",
    "isSender": true,
    "pic": "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
  },
];

class MessageList extends StatelessWidget {
  MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listMsg.length,
      itemBuilder: (BuildContext context, int index) {
        // if (listMsg[index]["pic"] != "") {
        //   return MyCachedNetworkImage(
        //     imageUrl: listMsg[index]["pic"],
        //   );
        // }
        return MessageTemplate(msg: listMsg[index]);
      },
    );
  }
}

class MessageTemplate extends StatelessWidget {
  MessageTemplate({Key? key, required this.msg}) : super(key: key);
  Map msg;
  double marginn = Get.width / 2.4;
  @override
  Widget build(BuildContext context) {
    if (!msg["isSender"]) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16.0, 8, marginn, 0),
        child: Container(
            // width: Get.width / 2,
            decoration: BoxDecoration(
                color: Color(0xffF3F6FB),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(28),
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28))),
            // height: 36,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8.0, 12, 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myText(txt: msg["msg"]),
                  Align(
                      alignment: Alignment.centerRight,
                      child: myText(
                          txt: "5:30 PM", fontSize: 10, color: Colors.grey))
                ],
              ),
            )),
      );
    } else if (msg["pic"] != "") {
      return Padding(
        padding: EdgeInsets.fromLTRB(marginn, 0, 16.0, 0),
        child: MyCachedNetworkImage(
          imageUrl: msg["pic"],
          borderRadius: 8,
          // circleRadius: ,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.fromLTRB(marginn, 8, 16.0, 0),
        child: Container(
            // width: Get.width / 2,
            decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(28),
                    bottomLeft: Radius.circular(28),
                    topLeft: Radius.circular(28))),
            // height: 36,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10.0, 12, 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myText(txt: msg["msg"], color: Colors.white),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          myText(
                              txt: "5:30 PM",
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.7)),
                          Icon(Icons.check, color: Colors.white, size: 12)
                        ],
                      )),
                ],
              ),
            )),
      );
    }
  }
}
