import 'dart:math';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class DivisionDragImageToAnswerController extends GetxController {
  DivisionDragImageToAnswerController();
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

    List<int> tmpQuestion = [];

    for (var i = 1; i <= 10; i++) {
      tmpQuestion.add(i * max);
    }

    if (questionCount < 10) {
      int questionIndex = Helper.getRandomNum(0, 10);
      question.value = tmpQuestion[questionIndex];
      questionCount.value++;
    }
    int res = (question.value / max).round();
    int tmp1 = res;
    while (tmp1 == res) {
      tmp1 = Helper.getRandomNum(1, 11);
    }

    answerList.add('${question.value} : $max = $res=res');
    answerList.add(
        '${question.value + max} : $max = ${((question.value + max) / max).round()}');
    answerList.add(
        '${question.value == max ? question.value + max * 3 : question.value - max} : $max = $tmp1');
    answerList.add('${question.value} : $max = $tmp1');

    answerList.shuffle();

    object.value = Helper.getRandomNum(0, 8);

    object.value = 4;
    correctIndex.value =
        answerList.indexOf('${question.value} : $max = $res=res');
    answerList[correctIndex.value] = '${question.value} : $max = $res';

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
