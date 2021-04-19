import 'dart:math';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class PlusChoiceNumberExerciseController extends GetxController {
  PlusChoiceNumberExerciseController();
  var random = new Random();
  final question = 0.obs;

  final questionCount = 0.obs;
  final rightAnswer = 0.obs;
  final showResult = false.obs;
  final next = false.obs;

  final answerList = <int>[].obs;

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
    this.max = Get.arguments['type'] == 'SM' ? 10 : 100;
    score.value = 0;
    generateNewQuestion();
    super.onInit();
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
    answerList.add((num1.value + num2.value));
    while (answerList.length != 3) {
      int answer =
          max == 10 ? Helper.getRandomNum(1, 10) : Helper.getRandomNum(11, 60);
      if (!answerList.contains(answer)) {
        answerList.add(answer);
      }
    }
    answerList.shuffle();

    object.value = Helper.getRandomNum(0, 8);
    correctIndex.value = answerList.indexOf((num1.value + num2.value));

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
