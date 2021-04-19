import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:math/common/routes/bindings/choice_number_exercise_binding.dart';
import 'package:math/common/routes/bindings/compare_choice_answer_exercise_binding.dart';
import 'package:math/common/routes/bindings/compare_choice_best_exercise_binding.dart';
import 'package:math/common/routes/bindings/compare_fill_exercise_binding.dart';
import 'package:math/common/routes/bindings/fill_number_inside_array_exercise_binding.dart';
import 'package:math/common/routes/bindings/minus_category_binding.dart';
import 'package:math/common/routes/bindings/multiplication_paragraph_exercise_binding.dart';
import 'package:math/common/routes/bindings/natural_number_category_binding.dart';
import 'package:math/common/routes/bindings/plus_drag_image_to_answer_exercise_binding.dart';
import 'package:math/common/routes/bindings/plus_fill_answer_exercise_binding.dart';
import 'package:math/common/routes/bindings/plus_paragraph_exercise_binding.dart';
import 'package:math/common/routes/bindings/sort_exercise_binding.dart';
import 'package:math/common/routes/routers.dart';
import 'package:math/presentation/controller/sort_exercise_controller.dart';
import 'package:math/presentation/journeys/compare/compare_best_answer_screen.dart';
import 'package:math/presentation/journeys/compare/compare_category_screen.dart';
import 'package:math/presentation/journeys/compare/compare_choice_answer_screen.dart';
import 'package:math/presentation/journeys/compare/compare_fill_answer_screen.dart';
import 'package:math/presentation/journeys/division/division_screen.dart';
import 'package:math/presentation/journeys/division/exercises/choice_answer/division_choice_answer_screen.dart';
import 'package:math/presentation/journeys/division/exercises/drag_image_to_answer/drag_image_to_answer_screen.dart';
import 'package:math/presentation/journeys/division/exercises/fill_answer/division_fill_answer_screen.dart';
import 'package:math/presentation/journeys/division/exercises/paragraph_exe/division_paragraph_exe_screen.dart';
import 'package:math/presentation/journeys/home/home_screen.dart';
import 'package:math/presentation/journeys/index.dart';
import 'package:math/presentation/journeys/minus/exercises/drag_image_to_answer/drag_image_to_answer_screen.dart';

import 'package:math/presentation/journeys/minus/exercises/minus_choice_answer/minus_choice_answer_screen.dart';
import 'package:math/presentation/journeys/minus/exercises/minus_fill_answer/minus_fill_answer_screen.dart';
import 'package:math/presentation/journeys/minus/exercises/paragraph_exe/minus_paragraph_exe_screen.dart';
import 'package:math/presentation/journeys/minus/minus_category_screen.dart';
import 'package:math/presentation/journeys/multiplication/exercises/choice_answer/multiplication_choice_answer_screen.dart';
import 'package:math/presentation/journeys/multiplication/exercises/drag_image_to_answer/drag_image_to_answer_screen.dart';
import 'package:math/presentation/journeys/multiplication/exercises/fill_answer/minus_fill_answer_screen.dart';
import 'package:math/presentation/journeys/multiplication/exercises/paragraph_exe/multiplication_paragraph_exe_screen.dart';

import 'package:math/presentation/journeys/multiplication/multiplication_screen.dart';
import 'package:math/presentation/journeys/natural_number/exercises/choice_number/choice_number_exercise_screen.dart';
import 'package:math/presentation/journeys/natural_number/exercises/fill_number_inside_array/fill_number_inside_array_screen.dart';
import 'package:math/presentation/journeys/natural_number/exercises/fill_number_inside_blank/fill_number_inside_blank_screen.dart';
import 'package:math/presentation/journeys/natural_number/exercises/sort_exe/sort_exercise_screen.dart';
import 'package:math/presentation/journeys/natural_number/number_category_screen.dart';
import 'package:math/presentation/journeys/plus/exercises/drag_image_to_answer/drag_image_to_answer_screen.dart';
import 'package:math/presentation/journeys/plus/exercises/paragraph_exe/plus_paragraph_exe_screen.dart';
import 'package:math/presentation/journeys/plus/exercises/plus_choice_answer/plus_choice_answer_screen.dart';
import 'package:math/presentation/journeys/plus/exercises/plus_fill_answer/plus_fill_answer_screen.dart';
import 'package:math/presentation/journeys/plus/plus_category_screen.dart';
import 'bindings/fill_number_inside_blank_exercise_binding.dart';
import 'bindings/minus_drag_image_to_answer_exercise_binding.dart';
import 'bindings/minus_choice_answer_exercise_binding.dart';
import 'bindings/minus_fill_answer_exercise_binding.dart';
import 'bindings/minus_paragraph_exercise_binding.dart';
import 'bindings/multiplication_choice_answer_exercise_binding.dart';
import 'bindings/multiplication_drag_image_to_answer_exercise_binding.dart';
import 'bindings/multiplication_fill_answer_exercise_binding.dart';
import 'bindings/plus_category_binding.dart';

import 'bindings/plus_choice_answer_exercise_binding.dart';

class Pages {
  static List<GetPage> getPages = [
    GetPage(
      name: Routers.home,
      page: () => IndexScreen(),
    ),
    GetPage(
      name: Routers.number,
      page: () => NaturalNumberScreen(),
      binding: NaturalNumberBinding(),
    ),
    GetPage(
      name: Routers.choiceNumEx,
      page: () => ChoiceNumberExerciseScreen(),
      binding: ChoiceNumberExerciseBinding(),
    ),
    GetPage(
      name: Routers.fillArray,
      page: () => FillNumberInsideArrayScreen(),
      binding: FillNumberInsideArrayExerciseBinding(),
    ),
    GetPage(
      name: Routers.fillBlank,
      page: () => FillNumberInsideBlankScreen(),
      binding: FillNumberInsideBlankExerciseBinding(),
    ),
    GetPage(
      name: Routers.sort,
      page: () => SortExerciseScreen(),
      binding: SortExerciseBinding(),
    ),

    //compage page
    GetPage(
      name: Routers.compare,
      page: () => CompareCategoryScreen(),
      binding: PlusBinding(),
    ),
    GetPage(
      name: Routers.compareChoice,
      page: () => CompareChoiceAnswerScreen(),
      binding: CompareChoiceAnswerExeBinding(),
    ),
    GetPage(
      name: Routers.compareFill,
      page: () => CompareFillAnswerScreen(),
      binding: CompareFillExerciseBinding(),
    ),

    GetPage(
      name: Routers.compareBest,
      page: () => CompareBestAnswerScreen(),
      binding: CompareChoiceBestExeBinding(),
    ),
    //plus page
    GetPage(
      name: Routers.plus,
      page: () => PlusCategoryScreen(),
      binding: PlusBinding(),
    ),
    GetPage(
      name: Routers.plusChoiceAnsEx,
      page: () => PlusChoiceAnswerScreen(),
      binding: PlusChoiceAnswerExeBinding(),
    ),

    GetPage(
      name: Routers.plusFillAnswerEx,
      page: () => PlusFillAnswerScreen(),
      binding: PlusFillAnswerExeBinding(),
    ),

    GetPage(
      name: Routers.plusDragImageEx,
      page: () => DragImageToAnswerScreen(),
      binding: PlusDragImageToAnswerBinding(),
    ),
    GetPage(
      name: Routers.plusChoiceParagraphEx,
      page: () => PlusParagraphExeScreen(),
      binding: PlusParagraphExeBinding(),
    ),
    //minus page
    GetPage(
      name: Routers.minus,
      page: () => MinusCategoryScreen(),
      binding: MinusBinding(),
    ),
    GetPage(
      name: Routers.minusChoiceAnsEx,
      page: () => MinusChoiceAnswerScreen(),
      binding: MinusChoiceAnswerExeBinding(),
    ),

    GetPage(
      name: Routers.minusFillAnswerEx,
      page: () => MinusFillAnswerScreen(),
      binding: MinusFillAnswerExeBinding(),
    ),
    GetPage(
      name: Routers.minusDragImageEx,
      page: () => MinusDragImageToAnswerScreen(),
      binding: MinusDragImageToAnswerBinding(),
    ),
    GetPage(
      name: Routers.minusChoiceParagraphEx,
      page: () => MinusParagraphExeScreen(),
      binding: MinusParagraphExeBinding(),
    ),
    //multiplication route
    GetPage(
      name: Routers.multiplication,
      page: () => MultiplicationScreen(),
      binding: PlusBinding(),
    ),
    GetPage(
      name: Routers.multiplicationChoiceAnsEx,
      page: () => MultiplicationChoiceAnswerScreen(),
      binding: MultiplicationChoiceAnswerExeBinding(),
    ),

    GetPage(
      name: Routers.multiplicationFillAnswerEx,
      page: () => MultiplicationFillAnswerScreen(),
      binding: MultiplicationFillAnswerExeBinding(),
    ),
    GetPage(
      name: Routers.multiplicationDragImageEx,
      page: () => MultiplicationDragAnswerToImage(),
      binding: MultiplicationDragImageToAnswerBinding(),
    ),
    GetPage(
      name: Routers.multiplicationChoiceParagraphEx,
      page: () => MultiplicationParagraphExeScreen(),
      binding: MultiplicationParagraphExeBinding(),
    ),

    //division route
    GetPage(
      name: Routers.division,
      page: () => DivisionScreen(),
      binding: PlusBinding(),
    ),
    GetPage(
      name: Routers.divisionChoiceAnsEx,
      page: () => DivisionChoiceAnswerScreen(),
      binding: MultiplicationChoiceAnswerExeBinding(),
    ),

    GetPage(
      name: Routers.divisionFillAnswerEx,
      page: () => DivisionFillAnswerScreen(),
      binding: MultiplicationFillAnswerExeBinding(),
    ),
    GetPage(
      name: Routers.divisionDragImageEx,
      page: () => DivisionDragAnswerToImage(),
      binding: MultiplicationDragImageToAnswerBinding(),
    ),
    GetPage(
      name: Routers.divisionChoiceParagraphEx,
      page: () => DivisionParagraphExeScreen(),
      binding: MultiplicationParagraphExeBinding(),
    ),
  ];
}
