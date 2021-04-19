import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class PlusDragImageToAnswerController extends GetxController {
  PlusDragImageToAnswerController();
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
  int max;

  @override
  void onInit() {
    score.value = 0;
    this.max = Get.arguments['type'] == 'SM' ? 10 : 100;

    generateNewQuestion();
    super.onInit();
  }

  void generateNewQuestion() {
    cleanData();

    if (questionCount < 10) {
      num1.value =
          max == 10 ? Helper.getRandomNum(1, 10) : Helper.getRandomNum(11, 50);
      print('num1 ${num1.value}');
      if (max == 10) {
        num2.value = Helper.getRandomNum(1, 10 - num1.value + 1);
      } else {
        num2.value = 0;
        while (num2.value == 0 || (num2.value % 10 + num1.value % 10 > 9)) {
          print('a ${100 - num1.value}');
          num2.value = Helper.getRandomNum(11, 50);
          print('num2 $num2');
        }
      }
      questionCount.value++;
    }
    int tmp1 = Helper.getRandomNum(
        1, num1.value > num2.value ? num1.value + 1 : num2.value + 1);
    int tmp2 = num2.value;
    int tmp3 = num1.value;
    while (tmp2 == num2.value) {
      tmp2 = Helper.getRandomNum(1, max);
    }

    while (tmp3 == num1.value) {
      tmp3 = Helper.getRandomNum(1, max);
    }

    answerList.add('$num1 + $num2 = ${num1.value + num2.value}');
    answerList.add('$num1 + $num2 = ${num1.value + num2.value - tmp1}');
    answerList.add('$num1 + $tmp2 = ${num1.value + num2.value}');
    answerList.add('$tmp3 + $num2 = ${num1.value + num2.value - tmp1 + 1}');
    answerList.shuffle();

    object.value = Helper.getRandomNum(0, 8);
    correctIndex.value =
        answerList.indexOf('$num1 + $num2 = ${num1.value + num2.value}');

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
    submitCount.value = ++submitCount.value;
    if (index == correctIndex.value) {
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
