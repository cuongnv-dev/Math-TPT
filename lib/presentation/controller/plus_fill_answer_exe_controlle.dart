import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class PlusFillAnswerController extends GetxController {
  PlusFillAnswerController();
  var random = new Random();

  final questionCount = 0.obs;
  final showResult = false.obs;
  final next = false.obs;
  final done = false.obs;

  final resultList = <int>[].obs;
  final answerList = <String>[].obs;
  final ansStringList = <String>[].obs;

  final borderList = <int>[].obs;
  final showIndex = 0.obs;

  final num1 = 0.obs;
  final num2 = 0.obs;

  final submitCount = 0.obs;
  final score = 0.obs;
  final object = 0.obs;
  int max;

  @override
  void onInit() {
    this.max = Get.arguments['type'] == 'SM' ? 10 : 100;
    generateNewQuestion();
    score.value = 0;
    super.onInit();
  }

  void inputOnTap(int index) {
    for (int i = 0; i < borderList.length; i++) {
      if (borderList[i] == 0 && i != index) {
        borderList[i] = -1;
      }
    }
    borderList[index] = 0;
    answerList[index] = '-1';
    update();
  }

  void generateNewQuestion() {
    cleanData();
    if (questionCount < 10) {
      num1.value =
          max == 10 ? Helper.getRandomNum(1, 10) : Helper.getRandomNum(11, 50);
      if (max == 10) {
        num2.value = Helper.getRandomNum(1, 10 - num1.value + 1);
      } else {
        num2.value = 0;
        while (num2.value == 0 || (num2.value % 10 + num1.value % 10 > 9)) {
          num2.value = Helper.getRandomNum(11, 50);
        }
      }
      questionCount.value++;
    }
    resultList.addAll([num1.value, num2.value, num1.value + num2.value]);
    ansStringList.addAll(convertToStringList(resultList));

    object.value = Helper.getRandomNum(0, 8);
    for (var i = 0; i < ansStringList.length; i++) {
      answerList.add('-1');
      borderList.add(-1);
    }
    if (questionCount.value < 6) {
      print('max $max');
      if (max == 10) {
        borderList[1] = -2;
        answerList[1] = num2.value.toString();
      } else {
        borderList[2] = -2;
        borderList[3] = -2;
        answerList[2] = ansStringList[2];
        answerList[3] = ansStringList[3];
      }
    }

    update();
  }

  List<String> convertToStringList(List<int> intList) {
    List<String> res = [];
    for (var i = 0; i < intList.length; i++) {
      String tmp = intList[i].toString();
      res.addAll(tmp.split(''));
    }
    return res;
  }

  void keyBoardOnTap(String value, int index) {
    answerList[index] = value;

    if (answerList.indexOf('-1') == -1) {
      this.checkResult();
    }
    update();
  }

  void checkResult() {
    submitCount.value++;
    showResult.value = true;
    bool res = true;
    for (int i = 0; i < ansStringList.length; i++) {
      if (ansStringList[i] != answerList[i]) {
        borderList[i] = 2;
        res = false;
      } else {
        borderList[i] = 1;
      }
    }
    if (res) {
      score.value = score.value + this.getScore(submitCount.value);
      next.value = true;
      if (questionCount.value == 10) {
        done.value = true;
      }
    }
    update();
  }

  cleanData() {
    showResult.value = false;
    next.value = false;
    submitCount.value = 0;
    showIndex.value = 0;
    resultList.clear();
    borderList.clear();
    answerList.clear();
    done.value = false;
    ansStringList.clear();
  }

  void submitAnswer(List<int> answerList) {
    submitCount.value = ++submitCount.value;
    showResult.value = true;
    bool result = true;
    for (var i = 0; i < 3; i++) {
      if (answerList[i] != resultList[i]) {
        borderList[i] = -1;
        result = false;
      } else {
        borderList[i] = 1;
      }
    }

    if (result == true) {
      score.value += this.getScore(submitCount.value);

      next.value = true;
    }

    update();
  }

  int getScore(int submitCount) {
    switch (submitCount) {
      case 1:
        return 10;
      case 2:
        return 8;
      case 3:
        return 6;
      case 4:
        return 5;
      default:
        return 4;
    }
  }
}
