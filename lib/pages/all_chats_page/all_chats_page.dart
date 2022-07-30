import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatiflabs/services/string_const.dart';

import '../../services/widgets/my_icon_btn.dart';
import '../../services/widgets/my_text.dart';
import '../tasks_page/views/external_chat_body.dart';
import 'views/chat_body.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppBar(),
          body: TabBarView(
            children: [const ChatBody(), ExternalChatBody()],
          )),
    );
  }

  PreferredSizeWidget myAppBar() {
    return AppBar(
      backgroundColor: const Color(0xff292742),
      title: Row(
        children: [
          myText(
              txt: "XYZ Private Ltd",
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white),
          myIconBtn(
            alignment: Alignment.center,
            icon: Icons.keyboard_arrow_down,
            onPressed: () {},
          ),
        ],
      ),
      actions: [
        myIconBtn(
            iconColor: const Color(0xff9493A0),
            onPressed: () {},
            icon: Icons.search),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: myIconBtn(
              iconColor: const Color(0xff9493A0),
              onPressed: () {},
              icon: Icons.more_vert,
              alignment: Alignment.center),
        ),
      ],
      bottom: const TabBar(
        indicatorColor: Color(0xff21C58E),
        indicatorPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        indicatorWeight: 4,
        labelColor: colorPrimary,
        unselectedLabelColor: colorIconUnselcted,
        labelStyle: TextStyle(fontSize: 16),
        tabs: [
          Tab(
            text: "Internal",
          ),
          Tab(text: "External")
        ],
      ),
    );
  }
}
