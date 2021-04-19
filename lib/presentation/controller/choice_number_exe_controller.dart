import 'dart:math';

import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class ChoiceNumberExerciseController extends GetxController {
  ChoiceNumberExerciseController();
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

  @override
  void onInit() {
    generateNewQuestion();
    score.value = 0;
    super.onInit();
  }

  void generateNewQuestion() {
    cleanData();
    if (questionCount < 10) {
      question.value = Helper.getRandomNum(1, 11);
      questionCount.value++;
    }
    answerList.add(question.value);
    while (answerList.length != 3) {
      int answer = Helper.getRandomNum(1, 11);
      if (!answerList.contains(answer)) {
        answerList.add(answer);
      }
    }
    object.value = Helper.getRandomNum(0, 8);
    answerList.shuffle();
    correctIndex.value = answerList.indexOf(question.value);
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
