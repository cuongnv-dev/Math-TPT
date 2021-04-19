
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class MultiplicationFillAnswerController extends GetxController {
  MultiplicationFillAnswerController();
  var random = new Random();

  final questionCount = 0.obs;
  final showResult = false.obs;
  final next = false.obs;
  final done = false.obs;

  final resultList = <int>[].obs;
  final answerList = <int>[].obs;

  final borderList = <int>[].obs;
  final showIndex = 0.obs;

  final question = 0.obs;

  final submitCount = 0.obs;
  final score = 0.obs;
  final object = 0.obs;
  int max;

  @override
  void onInit() {
    this.max = Get.arguments['type'];
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
    answerList[index] = 0;
    update();
  }

  void generateNewQuestion() {
    cleanData();
    if (questionCount < 10) {
      question.value = Helper.getRandomNum(1, 10);
      questionCount.value++;
    }
    resultList.addAll([max, question.value, question.value * max]);

    object.value = Helper.getRandomNum(0, 8);
    borderList.addAll([-1, -1, -1]);
    answerList.addAll([0, 0, 0]);
    if (questionCount.value < 6) {
      borderList[0] = -2;
      answerList[0] = max;
    }
    // for (var i = 0; i < 3; i++) {
    //   borderList.add(-1);
    //   answerList.add(0);
    // }
    update();
  }

  void keyBoardOnTap(int value, int index) {
    answerList[index] = answerList[index] == 0
        ? value
        : int.parse('${answerList[index]}$value');
    if (answerList.indexOf(0) == -1) {
      int indexValue = resultList[index];
      if (indexValue < 10) {
        this.checkResult();
      } else if (answerList[index] > 9) {
        this.checkResult();
      }
    }
    update();
  }

  void checkResult() {
    submitCount.value++;
    showResult.value = true;
    bool res = true;
    for (int i = 0; i < resultList.length; i++) {
      if (resultList[i] != answerList[i]) {
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
    question.value = 0;
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
