import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:whatiflabs/models/chat_info_model.dart';
import 'package:whatiflabs/services/string_const.dart';
import 'package:whatiflabs/services/widgets/my_cached_network_image.dart';

import '../../../services/widgets/my_text.dart';
import '../../chat_user_page/chat_user.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Container(
        // color: Color(0xffE5E5E5),
        color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 16,
            ),
            topArea(),
            SizedBox(
              height: 12,
            ),
            const ChatList(),
          ],
        ),
      ),
    );
  }
}

Widget topArea() {
  return Row(
    children: [
      Chip(
        // padding: EdgeInsets.symmetric(vertical: 0),
        labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 9),
        label: myText(txt: "DM's (3)", color: colorPrimary),
        backgroundColor: colorPrimary.withOpacity(.15),
      ),
      SizedBox(
        width: 6,
      ),
      Chip(
        shape: StadiumBorder(side: BorderSide(color: Color(0xffE6E6E6))),
        // padding: EdgeInsets.symmetric(vertical: 0),
        labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        label: myText(txt: "Groups (8)", color: Color(0xff8D929D)),
        backgroundColor: Colors.transparent,
      ),
    ],
  );
}

List<ChatInfoModel> allChatsList = [
  ChatInfoModel(
      // profilePic: "https://i.pravatar.cc/150?img=",
      name: "Shrikanth",
      msg: "Any update on the landing..."),
  ChatInfoModel(
      name: "Arun Overa",
      msg: "Any update on the landing...",
      showVoiceIcon: false,
      showNotification: true),
  ChatInfoModel(name: "Deepak Guous", msg: "Any update on the landing..."),
  ChatInfoModel(
      name: "Gnanesh Kynay",
      msg: "Any update on the landing...",
      showVoiceIcon: true),
  ChatInfoModel(name: "Shrikanth", msg: "Any update on the landing..."),
];

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allChatsList.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              ChatInfoModel chatInfoModel = allChatsList[index];
              chatInfoModel.profilePic += index.toString();
              Get.to(() => ChatUserPage(chatInfoModel: chatInfoModel));
            },
            child:
                ChatTemplate(index: index, chatInfoModel: allChatsList[index]));
      },
    );
  }
}

class ChatTemplate extends StatelessWidget {
  ChatInfoModel chatInfoModel;
  int index;
  ChatTemplate({Key? key, required this.chatInfoModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        // height: 58,
        // color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyCachedNetworkImage(
                  padding: EdgeInsets.only(top: 2),
                  imageUrl: chatInfoModel.profilePic + index.toString(),
                  // "https://miro.medium.com/max/1400/0*0fClPmIScV5pTLoE.jpg",
                  circleRadius: 20,
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
                                  child: Row(
                                    children: [
                                      myText(
                                          txt: chatInfoModel.name,
                                          textOverflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      if (chatInfoModel.showNotification)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 4.0),
                                          child: Icon(
                                              Icons.circle_notifications,
                                              size: 20,
                                              color: Color(0xff8D929D)),
                                        )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  // color: Colors.blue,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: myText(
                                            txt: "Any update on the landing...",
                                            fontWeight: FontWeight.w400,
                                            textOverflow: TextOverflow.ellipsis,
                                            color: Color(0xff1B263B)
                                                .withOpacity(0.5)),
                                      ),
                                      chatInfoModel.showVoiceIcon
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 3.0),
                                              child: Icon(
                                                Icons.keyboard_voice,
                                                color: Color(0xff8D929D),
                                                size: 20,
                                              ),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              myText(
                                  txt: "11:45am",
                                  fontSize: 12,
                                  color: colorPrimary),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                  width: 23,
                                  height: 23,
                                  // child: Icon(CustomIcons.option, size: 20,),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: colorPrimary),
                                  // decoration: BoxDecoration(
                                  //     color: colorPrimary,
                                  //     // border: Border(),
                                  //     borderRadius: BorderRadius.circular(80)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Center(
                                        child: myText(
                                            txt: "2",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: 1,
                        color: Color(0xffE0E0E0CF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
