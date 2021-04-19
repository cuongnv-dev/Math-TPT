import 'dart:math';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class MultiplicationDragImageToAnswerController extends GetxController {
  MultiplicationDragImageToAnswerController();
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
    this.max = Get.arguments['type'];
    generateNewQuestion();
    super.onInit();
  }

  void generateNewQuestion() {
    cleanData();
    print(max);
    if (questionCount < 10) {
      question.value = Helper.getRandomNum(1, 10);
      questionCount.value++;
    }
    int tmp1 = question.value;
    while (tmp1 == question.value || tmp1 == max) {
      tmp1 = Helper.getRandomNum(1, 10);
    }
    answerList.add('$max x ${question.value} = ${question.value * max}');
    answerList.add('$max x $tmp1 = ${question.value * max}');
    answerList.add('$tmp1 x ${question.value} = ${tmp1 * question.value}');
    answerList.add('${question.value} x ${max + 1} = $tmp1');

    answerList.shuffle();

    object.value = Helper.getRandomNum(0, 8);
    correctIndex.value = answerList
        .indexOf('$max x ${question.value} = ${question.value * max}');

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
