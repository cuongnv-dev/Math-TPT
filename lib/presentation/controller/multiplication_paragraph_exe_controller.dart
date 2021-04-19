import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';
import 'package:math/data/mock/paragraph_question.dart';
import 'package:math/data/mock/paragraph_question_constant.dart';

class MultiplicationParagraphExerciseController extends GetxController {
  MultiplicationParagraphExerciseController();
  var random = new Random();

  final questionCount = 0.obs;
  final showResult = false.obs;
  final next = false.obs;
  final done = false.obs;

  final resultList = <int>[].obs;
  final answerList = <int>[].obs;
  final question = 0.obs;

  final borderList = <int>[].obs;

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
      questionCount.value++;
    }
    ParagraphQuestion tmpObj;
    switch (max) {
      case 2:
        tmpObj = ParagraphQuestionConstant.listMul2[questionCount.value - 1];
        break;
      case 3:
        tmpObj = ParagraphQuestionConstant.listMul3[questionCount.value - 1];
        break;
      case 4:
        tmpObj = ParagraphQuestionConstant.listMul4[questionCount.value - 1];
        break;
      case 5:
        tmpObj = ParagraphQuestionConstant.listMul5[questionCount.value - 1];
        break;
      default:
    }
    resultList.addAll([...tmpObj.nums, tmpObj.nums[2]]);
    for (var i = 0; i < 4; i++) {
      borderList.add(-1);
      answerList.add(0);
    }
    update();
  }

  void keyBoardOnTap(int value, int index) {
    answerList[index] = answerList[index] == 0
        ? value
        : int.parse('${answerList[index]}$value');

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
