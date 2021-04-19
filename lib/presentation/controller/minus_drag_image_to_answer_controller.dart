import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class MinusDragImageToAnswerController extends GetxController {
  MinusDragImageToAnswerController();
  var random = new Random();
  final question = 0.obs;

  final questionCount = 0.obs;
  final rightAnswer = 0.obs;
  final showResult = false.obs;
  final next = false.obs;

  final answerList = <String>[].obs;

  final questionList = <int>[].obs;

  final selectedIndex = 0.obs;
  final correctIndex = 0.obs;

  final submitCount = 0.obs;
  final score = 0.obs;

  final object = 0.obs;

  int max;

  @override
  void onInit() {
    this.max = Get.arguments['type'] == 'SM' ? 10 : 20;
    generateNewQuestion();
    score.value = 0;
    super.onInit();
  }

  void generateNewQuestion() {
    cleanData();

    if (questionCount < 10) {
      if (max == 10) {
        int num1 = Helper.getRandomNum(1, 11);

        int num2 = num1;
        while (num2 == num1) {
          num2 = Helper.getRandomNum(1, 11);
        }
        questionList.addAll([num1, num2]);
        questionList.sort();
      } else {
        int num1 = Helper.getRandomNum(11, 41);
        int num2 = 0;
        while (num2 <= num1 || num2 % 10 < num1 % 10) {
          num2 = Helper.getRandomNum(11, 51);
        }
        questionList.addAll([num1, num2]);
      }
      questionCount.value++;
    }
    int tmp1 = Helper.getRandomNum(1, questionList[1]);
    int tmp2 = questionList[0];
    int tmp3 = questionList[1];
    while (tmp2 == questionList[0]) {
      tmp2 = Helper.getRandomNum(1, max);
    }

    while (tmp3 == questionList[1]) {
      tmp3 = Helper.getRandomNum(1, max);
    }

    answerList.add(
        '${questionList[1]} - ${questionList[0]} = ${questionList[1] - questionList[0]}ans');
    answerList.add(
        '${questionList[1]} - ${questionList[0]} = ${questionList[1] - questionList[0] + tmp1}');
    answerList.add(
        '${questionList[1]} - $tmp2 = ${questionList[1] - questionList[0]}');
    answerList.add(
        '$tmp3 - ${questionList[0]} = ${questionList[1] - questionList[0] + tmp1}');
    answerList.shuffle();

    object.value = Helper.getRandomNum(0, 8);
    correctIndex.value = answerList.indexOf(
        '${questionList[1]} - ${questionList[0]} = ${questionList[1] - questionList[0]}ans');
    answerList[correctIndex.value] =
        '${questionList[1]} - ${questionList[0]} = ${questionList[1] - questionList[0]}';

    update();
  }

  cleanData() {
    showResult.value = false;
    next.value = false;
    submitCount.value = 0;
    selectedIndex.value = 0;
    answerList.clear();
    questionList.clear();
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
