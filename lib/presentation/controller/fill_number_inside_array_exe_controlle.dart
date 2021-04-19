import 'dart:io';

import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class FillNumberInsideArrayExeController extends GetxController {
  FillNumberInsideArrayExeController();
  final showResult = false.obs;
  final next = false.obs;
  final resultList = <int>[].obs;
  final borderList = <int>[].obs;
  final questionList = <int>[].obs;
  final count = 0.obs;
  final submitCount = 0.obs;
  final score = 0.obs;
  final questionCount = 0.obs;
  final done = false.obs;
  int max = 0;

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
      questionCount.value++;
    }
    int first;
    if (questionCount.value < 4) {
      first =
          max == 10 ? Helper.getRandomNum(0, 9) : Helper.getRandomNum(11, 98);
      print(first);
      count.value = 3;
      borderList.addAll([-2, -1, -2]);
      questionList.addAll([first, 0, first + 2]);
      resultList.addAll([first, first + 1, first + 2]);
    } else if (questionCount.value < 6) {
      first =
          max == 10 ? Helper.getRandomNum(0, 7) : Helper.getRandomNum(11, 96);

      count.value = 5;
      borderList.addAll([-2, -1, -2, -1, -2]);
      questionList.addAll([first, 0, first + 2, 0, first + 4]);
      resultList.addAll([first, first + 1, first + 2, first + 3, first + 4]);
    } else if (questionCount.value < 9) {
      first =
          max == 10 ? Helper.getRandomNum(0, 4) : Helper.getRandomNum(11, 92);

      count.value = 8;

      borderList.addAll([-2, -1, -2, -1, -2, -1, -1, -2]);
      questionList.addAll([first, 0, first + 2, 0, first + 4, 0, 0, first + 7]);
      resultList.addAll([
        first,
        first + 1,
        first + 2,
        first + 3,
        first + 4,
        first + 5,
        first + 6,
        first + 7
      ]);
    } else {
      first =
          max == 10 ? Helper.getRandomNum(0, 2) : Helper.getRandomNum(11, 90);

      count.value = 10;

      borderList.addAll([-2, -1, -2, -1, -2, -1, -1, -2, -1, -2]);
      questionList.addAll(
          [first, 0, first + 2, 0, first + 4, 0, 0, first + 7, 0, first + 9]);
      resultList.addAll([
        first,
        first + 1,
        first + 2,
        first + 3,
        first + 4,
        first + 5,
        first + 6,
        first + 7,
        first + 8,
        first + 9
      ]);
    }
    update();
  }

  void keyBoardOnTap(int value, int index) {
    questionList[index] = questionList[index] == 0
        ? value
        : int.parse('${questionList[index]}$value');
    List<int> checkList = List.from(questionList);
    checkList.removeAt(0);
    print(checkList);
    if (checkList.indexOf(0) == -1) {
      int indexValue = questionList[0] + index;

      if (indexValue < 10) {
        this.checkResult();
      } else if (questionList[index] > 9) {
        this.checkResult();
      }
    }
    update();
  }

  void checkResult() {
    submitCount.value++;
    showResult.value = true;
    bool res = true;
    for (int i = 0; i < questionList.length; i++) {
      if (questionList[i] != resultList[i]) {
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

  void inputOnTap(int index) {
    for (int i = 0; i < borderList.length; i++) {
      if (borderList[i] == 0 && i != index) {
        borderList[i] = -1;
      }
    }
    borderList[index] = 0;
    questionList[index] = 0;
    update();
  }

  cleanData() {
    showResult.value = false;
    next.value = false;
    borderList.clear();
    resultList.clear();
    questionList.clear();
    submitCount.value = 0;
    count.value = 0;
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
