import 'package:get/get.dart';
import 'package:math/common/utils/helper.dart';

class SortExerciseController extends GetxController {
  SortExerciseController();
  final showResult = false.obs;
  final next = false.obs;
  final questionCount = 0.obs;
  final randomList = <int>[].obs;
  final borderList = <int>[].obs;
  final questionList = <int>[].obs;
  final submitCount = 0.obs;
  final score = 0.obs;
  final type = ''.obs;
  int max = 0;

  @override
  void onInit() {
    type.value = Get.arguments['type'] == 'AZ' ? 'AZ' : 'ZA';
    this.max = Get.arguments['max'] == 'SM' ? 10 : 100;
    generateNewQuestion();
    score.value = 0;

    super.onInit();
  }

  void generateNewQuestion() {
    questionCount.value++;

    cleanData();
    while (randomList.length != 4) {
      int numb =
          max == 10 ? Helper.getRandomNum(1, 11) : Helper.getRandomNum(11, 99);
      if (!randomList.contains(numb)) {
        randomList.add(numb);
      }
    }
    randomList.shuffle();
    for (var i = 0; i < 4; i++) {
      borderList.add(0);
    }
    update();
  }

  cleanData() {
    showResult.value = false;
    next.value = false;
    borderList.clear();
    randomList.clear();
    questionList.clear();
    submitCount.value = 0;
  }

  void submitAnswer(List<int> answers) {
    List<int> tmp = [];
    for (var i = 0; i < 4; i++) {
      tmp.add(randomList[i]);
    }
    tmp.sort();
    submitCount.value = ++submitCount.value;
    showResult.value = true;
    for (var i = 0; i < 4; i++) {
      if (answers[i] != (type == 'AZ' ? tmp[i] : tmp[3 - i])) {
        borderList[i] = -1;
      } else {
        borderList[i] = 1;
      }
    }
    if (!answers.contains(-1) && !borderList.contains(-1)) {
      score.value = score.value + this.getScore(submitCount.value);
      next.value = true;
    }

    update();
  }

  int getScore(int submitCount) {
    switch (submitCount) {
      case 4:
        return 10;
      case 5:
        return 8;
      case 6:
        return 6;
      case 8:
        return 5;
      default:
        return 4;
    }
  }
}
