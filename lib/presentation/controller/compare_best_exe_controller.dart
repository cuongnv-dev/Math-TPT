import 'dart:math';
import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class CompareBestExeController extends GetxController {
  CompareBestExeController();
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
  final type = ''.obs;

  @override
  void onInit() {
    this.type.value = Get.arguments['type'];
    score.value = 0;
    generateNewQuestion();
    super.onInit();
  }

  void generateNewQuestion() {
    print(Get.arguments['max']);
    cleanData();
    if (questionCount < 10) {
      while (answerList.length != 3) {
        int answer = Get.arguments['max'] == 'SM'
            ? Helper.getRandomNum(1, 11)
            : Helper.getRandomNum(11, 51);

        if (!answerList.contains(answer)) {
          answerList.add(answer);
        }
      }
      questionCount.value++;
    }
    answerList.shuffle();
    print(answerList);
    List<int> tmp = [];
    for (var i = 0; i < 3; i++) {
      tmp.add(answerList[i]);
    }
    tmp.sort();
    correctIndex.value = questionCount < 6
        ? answerList.indexOf(tmp[2])
        : answerList.indexOf(tmp[0]);
    print(correctIndex);

    object.value = Helper.getRandomNum(0, 8);

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
