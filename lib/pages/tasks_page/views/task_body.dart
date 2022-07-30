import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatiflabs/models/task_model.dart';
import 'package:whatiflabs/services/string_const.dart';
import 'package:whatiflabs/services/widgets/my_cached_network_image.dart';
import 'package:whatiflabs/services/widgets/my_icon_btn.dart';
import 'package:whatiflabs/services/widgets/my_rich_text.dart';

import '../../../services/widgets/my_text.dart';

class TasksBody extends StatelessWidget {
  const TasksBody({Key? key}) : super(key: key);

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
            const TasksList(),
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
        shape: StadiumBorder(side: BorderSide(color: Color(0xffE6E6E6))),
        // padding: EdgeInsets.symmetric(vertical: 0),
        labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        label: myText(txt: "Today - Dues (2)", color: Color(0xff8D929D)),
        backgroundColor: Colors.transparent,
      ),
      SizedBox(
        width: 6,
      ),
      Chip(
        // padding: EdgeInsets.symmetric(vertical: 0),
        labelPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 9),
        label: myText(txt: "All (7)", color: colorPrimary),
        backgroundColor: colorPrimary.withOpacity(.15),
      ),
      Spacer(),
      Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE6E6E6)),
              color: Color(0xffF7F7F7),
              borderRadius: BorderRadius.circular(2)),
          child: myIconBtn(
              alignment: Alignment.center,
              iconColor: Colors.grey,
              icon: Icons.sort,
              onPressed: () {}))
    ],
  );
}

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return TaskTemplate2();
      },
    );
  }
}

class TaskTemplate2 extends StatefulWidget {
  const TaskTemplate2({Key? key}) : super(key: key);

  @override
  State<TaskTemplate2> createState() => _TaskTemplate2State();
}

class _TaskTemplate2State extends State<TaskTemplate2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(.3)),
          color: Color(0xffC4C4C4).withOpacity(.14),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            taskHeader(),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 1,
              // width: double.infinity,
              color: Color(0xffE6E6E6),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(color: Colors.grey.withOpacity(.3)),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: Column(
                children: [
                  subTasks("First 5 screens design", "", isCompleted: true),
                  subTasks("Payment from Shrikanth", "Shrikant"),
                  subTasks("Talk with CEO about design changes", ""),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget taskHeader() {
    return Container(
      // color: Colors.grey,
      child: Row(
        children: <Widget>[
          Checkbox(
            // overlayColor: Color(0xff86909D),
            value: false,
            onChanged: (val) {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              myText(txt: "My Payslip", fontWeight: FontWeight.w500),
              SizedBox(
                height: 4,
              ),
              myText(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  txt: "1 pending",
                  color: Colors.red),
              // Container(
              //   height: 8,
              //   // width: double.infinity,
              //   color: Colors.white,
              // )
            ],
          ),
          Spacer(),
          myIconBtn(
              alignment: Alignment.centerLeft,
              iconColor: colorPrimary,
              icon: Icons.add,
              onPressed: () {})
        ],
      ),
    );
  }

  Widget subTasks(String taskTitle, String assignedTo, {isCompleted = false}) {
    return Row(
      children: <Widget>[
        Checkbox(
            activeColor: colorPrimary,
            value: isCompleted,
            onChanged: (val) {
              // isCompleted = !isCompleted;
              // setState(() {});
            }),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            myText(
              color: isCompleted ? Colors.grey : Colors.black,
              txt: taskTitle,
              strikeText: isCompleted ? TextDecoration.lineThrough : null,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 6.5,
            ),
            Row(
              children: [
                if (assignedTo != "")
                  Row(
                    children: [
                      myRichText(
                          text1: "Assigned to: ",
                          text2: "${assignedTo}",
                          onPressed: () {}),
                      myText(txt: " | ", fontSize: 12, color: Colors.grey)
                    ],
                  ),
                myText(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey,
                    txt: "15 Dec 7:45 PM")
              ],
            ),
          ],
        )
      ],
    );
  }
}

class TaskTemplate extends StatelessWidget {
  int index;
  TaskTemplate({Key? key, required this.index}) : super(key: key);

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
                  imageUrl:
                      "https://miro.medium.com/max/1400/0*0fClPmIScV5pTLoE.jpg",
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
                                          txt: "Srikant $index",
                                          textOverflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      if (index == 1)
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
                                      index == 3
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
