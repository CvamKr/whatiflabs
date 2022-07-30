import 'package:flutter/material.dart';

Widget myRichText(
    {String text1 = "", String text2 = "", required Function() onPressed}) {
  return InkWell(
    onTap: onPressed,

    // () {
    //   // if (text2 == "Log In" || text2 == "Login") {
    //   //   Get.to(() => MyLoginPage());
    //   // } else if (text2 == "Reset") {
    //   //   Get.to(() => SecurityQuestionPage(isForSetPin: false));
    //   // } else if (text2 == "Register Now") {
    //   //   Get.to(() => RegisterPage());
    //   // } else if (text2 == "Profile") {
    //   //   Get.to(() => ProfilePage());
    //   // }
    // },
    child: Align(
      alignment: Alignment.center,
      child: RichText(
        // Controls visual overflow
        overflow: TextOverflow.clip,

        // Controls how the text should be aligned horizontally
        textAlign: TextAlign.end,

        // Control the text direction
        textDirection: TextDirection.rtl,

        // Whether the text should break at soft line breaks
        softWrap: true,

        // Maximum number of lines for the text to span
        maxLines: 1,

        // The number of font pixels for each logical pixel
        textScaleFactor: 1,
        text: TextSpan(
          text: text1,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontFamily: 'SFPro',
            // fontWeight: FontWeight.w500
          ),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.w500,
                    fontFamily: 'SFPro',
                    color: Color(0xffF2994A))),
          ],
        ),
      ),
    ),
  );
}
