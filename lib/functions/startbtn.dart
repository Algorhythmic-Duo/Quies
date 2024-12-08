import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quies/pages/quizpage.dart';

Future<void> startBtn(
  String namecontroller,
  BuildContext context,
  List<String> dataList,
) async {
  if (namecontroller.isEmpty == true) {
    final warning = SnackBar(
      backgroundColor: Colors.red,
      content: const Text("Enter your name befor starting"),
      action: SnackBarAction(
        label: '',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(warning);
  } else {
    List<String> usedids = [];
    int random = Random().nextInt(dataList.length);
    String startid = dataList[random];
    usedids.add(startid);
    CollectionReference cd = FirebaseFirestore.instance.collection("quies");
    DocumentSnapshot ds = await cd.doc(startid).get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            QuizPage(data: data, docIds: dataList, usedIds: usedids),
      ),
    );
  }
}
