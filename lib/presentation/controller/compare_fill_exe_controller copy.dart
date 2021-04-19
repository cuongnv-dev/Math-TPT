import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class CompareFillExeController extends GetxController {
  CompareFillExeController();
  var random = new Random();
  final question = 0.obs;

  final questionCount = 0.obs;
  final rightAnswer = 0.obs;
  final showResult = false.obs;
  final next = false.obs;

  final answerList = <String>[].obs;

  final num1 = 0.obs;
  final num2 = 0.obs;

  final selectedIndex = 0.obs;
  final correctIndex = 0.obs;

  final submitCount = 0.obs;
  final score = 0.obs;

  final object = 0.obs;

  @override
  void onInit() {
    score.value = 0;

    generateNewQuestion();
    super.onInit();
  }

  void generateNewQuestion() {
    cleanData();

    if (questionCount < 10) {
      num1.value = Get.arguments['max'] == 'SM'
          ? Helper.getRandomNum(1, 11)
          : Helper.getRandomNum(11, 51);
      num2.value = Get.arguments['max'] == 'SM'
          ? Helper.getRandomNum(1, 11)
          : Helper.getRandomNum(11, 51);
      object.value = Helper.getRandomNum(0, 8);
      questionCount.value++;
    }
    answerList.addAll(['>', '=', '<']);

    String tmp =
        num1.value > num2.value ? '>' : (num1.value == num2.value ? '=' : '<');

    correctIndex.value = answerList.indexOf(tmp);
    update();
  }

  cleanData() {
    showResult.value = false;
    next.value = false;
    submitCount.value = 0;
    selectedIndex.value = 0;
    answerList.clear();
  }

  void submitAnswer(int index) {
    print(index);
    submitCount.value = ++submitCount.value;
    if (index == correctIndex.value) {
      print('dung');
      next.value = true;
      score.value += this.getScore(submitCount.value);
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
      default:
        return 5;
    }
  }
}
