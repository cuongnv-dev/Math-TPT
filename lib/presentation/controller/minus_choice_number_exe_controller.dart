import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class MinusChoiceNumberExerciseController extends GetxController {
  MinusChoiceNumberExerciseController();
  var random = new Random();
  final question = 0.obs;

  final questionCount = 0.obs;
  final rightAnswer = 0.obs;
  final showResult = false.obs;
  final next = false.obs;

  final answerList = <int>[].obs;

  final questionList = <int>[].obs;

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
    answerList.add(questionList[1] - questionList[0]);
    while (answerList.length != 3) {
      int answer = Helper.getRandomNum(1, max);
      if (!answerList.contains(answer)) {
        answerList.add(answer);
      }
    }
    answerList.shuffle();
    object.value = Helper.getRandomNum(0, 8);
    correctIndex.value = answerList.indexOf(questionList[1] - questionList[0]);

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

    showResult.value = true;
    selectedIndex.value = index;
    if (index == correctIndex.value) {
      rightAnswer.value++;
      next.value = true;
      score.value = score.value + this.getScore(submitCount.value);
      print('score $score');
    }
    update();
  }

  int getScore(int submitCount) {
    switch (submitCount) {
      case 1:
        return 10;
      case 2:
        return 7;
      default:
        return 5;
    }
  }
}
