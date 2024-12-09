import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quies/functions/colors.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitial()) {
    on<FetchDocId>((event, emit) async {
      emit(BlocLoading());
      try {
        QuerySnapshot querySnapshot =
            await FirebaseFirestore.instance.collection('quies').get();
        List<String> docIds = querySnapshot.docs.map((doc) => doc.id).toList();
        String startid = randomQustion(docIds, state.usedIds);
        state.usedIds.add(startid);
        Map<String, dynamic> data = await datafrombase(startid);
        List<String> quslist = qustionsList(data);
        emit(BlocLoaded(data, 0, docIds, state.usedIds, quslist));
      } catch (e) {
        emit(BlocError(e.toString()));
      }
    });
    on<CorrectOption>((event, emit) async {
      List<Color> updateColor = List<Color>.from(state.color);
      updateColor[event.index] = correctColor;
      emit(ColorChange(updateColor, state.count + 1, state.docIds,
          state.usedIds, state.data, state.quslist));
      if (state.usedIds.length < 10) {
        String startid = randomQustion(state.docIds, state.usedIds);
        state.usedIds.add(startid);
        Map<String, dynamic> data = await datafrombase(startid);
        List<String> quslist = qustionsList(data);
        emit(QustionChange(
            data, state.count, state.docIds, state.usedIds, quslist));
      }
    });
    on<WrongOption>((event, emit) async {
      List<Color> updateColor = List<Color>.from(state.color);
      updateColor[event.index] = wrongColor;
      emit(ColorChange(updateColor, state.count, state.docIds, state.usedIds,
          state.data, state.quslist));
      if (state.usedIds.length < 10) {
        String startid = randomQustion(state.docIds, state.usedIds);
        state.usedIds.add(startid);
        Map<String, dynamic> data = await datafrombase(startid);
        List<String> quslist = qustionsList(data);
        emit(QustionChange(
            data, state.count, state.docIds, state.usedIds, quslist));
      }
    });
  }
}

Future<Map<String, dynamic>> datafrombase(String startid) async {
  CollectionReference cd = FirebaseFirestore.instance.collection("quies");
  DocumentSnapshot ds = await cd.doc(startid).get();
  Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
  return data;
}

String randomQustion(List<String> dataList, List usedList) {
  int random = Random().nextInt(dataList.length);
  String startid = dataList[random];
  if (usedList.contains(startid) == true) {
    startid = randomQustion(dataList, usedList);
  }
  return startid;
}

List<String> qustionsList(Map<String, dynamic> data) {
  List<String> quslist = [];
  quslist.add(data["Option1"]);
  quslist.add(data["Option2"]);
  quslist.add(data["Option3"]);
  quslist.add(data["correctAns"]);
  quslist.shuffle();
  return quslist;
}
