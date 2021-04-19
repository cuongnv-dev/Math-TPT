import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class FillNumberInsideBlankExeController extends GetxController {
  FillNumberInsideBlankExeController();
  final showResult = false.obs;
  final next = false.obs;

  final borderList = <int>[].obs;
  final questionList = <int>[].obs;
  final submitCount = 0.obs;
  final score = 0.obs;
  final question = 0.obs;
  final answerList = <int>[].obs;

  final questionCount = 0.obs;
  final rightAnswer = 0.obs;
  final object = 0.obs;
  final done = false.obs;

  @override
  void onInit() {
    generateNewQuestion();
    score.value = 0;
    super.onInit();
  }

  void generateNewQuestion() {
    cleanData();
    questionCount.value++;
    while (questionList.length != 3) {
      int numb = Helper.getRandomNum(1, 11);
      if (!questionList.contains(numb)) {
        questionList.add(numb);
      }
    }
    questionList.shuffle();

    object.value = Helper.getRandomNum(0, 8);
    for (var i = 0; i < 3; i++) {
      borderList.add(-1);
      answerList.add(0);
    }
    update();
  }

  void keyBoardOnTap(int value, int index) {
    answerList[index] = answerList[index] == 0
        ? value
        : int.parse('${answerList[index]}$value');
    if (answerList.indexOf(0) == -1) {
      int indexValue = questionList[index];
      print(indexValue);
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
    for (int i = 0; i < questionList.length; i++) {
      if (questionList[i] != answerList[i]) {
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
    answerList[index] = 0;
    update();
  }

  cleanData() {
    showResult.value = false;
    answerList.clear();
    next.value = false;
    borderList.clear();
    questionList.clear();
    submitCount.value = 0;
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
