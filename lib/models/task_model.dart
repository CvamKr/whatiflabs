// // To parse this JSON data, do
// //
// //     final taskTemplate = taskTemplateFromJson(jsonString);

// import 'dart:convert';

// TaskModel taskTemplateFromJson(String str) =>
//     TaskModel.fromJson(json.decode(str));

// String taskTemplateToJson(TaskModel data) => json.encode(data.toJson());

// class TaskModel {
//   TaskModel({
//     required this.title,
//     this.assignedTo = "",
//     this.dueDate = "",
//     this.isCompleted = false,
//   });

//   String title;
//   String assignedTo;
//   String dueDate;
//   bool isCompleted;

//   factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
//         title: json["title"],
//         assignedTo: json["assignedTo"],
//         dueDate: json["dueDate"],
//         isCompleted: json["isCompleted"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "assignedTo": assignedTo,
//         "dueDate": dueDate,
//         "isCompleted": isCompleted,
//       };
// }

// List<TaskModel> tasksList = [];

List<String> listTaskTitle = [
 "First 5 screens design",
 "Payment from Shrikanth",
 "Talk with CEO about design changes"
];
