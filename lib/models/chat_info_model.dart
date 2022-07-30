// To parse this JSON data, do
//
//     final chatInfoModel = chatInfoModelFromJson(jsonString);

import 'dart:convert';

ChatInfoModel chatInfoModelFromJson(String str) =>
    ChatInfoModel.fromJson(json.decode(str));

String chatInfoModelToJson(ChatInfoModel data) => json.encode(data.toJson());

class ChatInfoModel {
  ChatInfoModel(
      {required this.name,
      required this.msg,
      this.time = "11:45 am",
      this.msgCount = 2,
      this.showNotification = false,
      this.profilePic = "https://i.pravatar.cc/150?img=",
      this.showVoiceIcon= false});

  String name;
  String msg;
  String time;
  int msgCount;
  bool showNotification;
  String profilePic;
  bool showVoiceIcon;

  factory ChatInfoModel.fromJson(Map<String, dynamic> json) => ChatInfoModel(
        name: json["name"],
        msg: json["msg"],
        time: json["time"],
        msgCount: json["msgCount"],
        showNotification: json["showNotification"],
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "msg": msg,
        "time": time,
        "msgCount": msgCount,
        "showNotification": showNotification,
        "profilePic": profilePic,
      };
}
