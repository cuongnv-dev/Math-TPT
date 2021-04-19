import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class DivisionChoiceNumberExerciseController extends GetxController {
  DivisionChoiceNumberExerciseController();
  var random = new Random();
  final question = 0.obs;

  final questionCount = 0.obs;
  final rightAnswer = 0.obs;
  final showResult = false.obs;
  final next = false.obs;

  final answerList = <int>[].obs;

  final selectedIndex = 0.obs;
  final correctIndex = 0.obs;

  final submitCount = 0.obs;
  final score = 0.obs;

  final object = 0.obs;
  int max;

  @override
  void onInit() {
    score.value = 0;
    this.max = Get.arguments['type'];
    generateNewQuestion();
    super.onInit();
  }

  void generateNewQuestion() {
    cleanData();
    List<int> tmpQuestion = [];

    for (var i = 1; i <= 10; i++) {
      tmpQuestion.add(i * max);
    }

    if (questionCount < 10) {
      int questionIndex = Helper.getRandomNum(0, 10);
      question.value = tmpQuestion[questionIndex];
      questionCount.value++;
    }
    answerList.add((question.value / max).round());
    while (answerList.length != 3) {
      int answer = Helper.getRandomNum(1, 11);
      if (!answerList.contains(answer)) {
        answerList.add(answer);
      }
    }
    answerList.shuffle();
    object.value = Helper.getRandomNum(0, 8);
    correctIndex.value = answerList.indexOf(question.value / max);

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
