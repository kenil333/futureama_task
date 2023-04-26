import 'package:flutter/material.dart';

import '../../data/model/question_model.dart';
import '../../domain/repository/api_repository.dart';
import '../../domain/utils/common_toast.dart';
import '../../domain/utils/error_msg.dart';
import '../../utils/app_enums.dart';
import '../../utils/app_method.dart';
import '../screens/quiz_result_screen.dart';

class QuizProvider extends ChangeNotifier {
  final ApiRepository apiRepo = ApiRepository();

  List<QuestionModel> _questionList = [];
  ScreenState _state = ScreenState.loading;
  int _currentQution = 0;
  int _correct = 0;
  int _wrong = 0;
  final ValueNotifier<int?> _selectedAnswer = ValueNotifier(null);

  List<QuestionModel> get questionList => _questionList;
  ScreenState get state => _state;
  int get currentQution => _currentQution;
  int get correct => _correct;
  int get wrong => _wrong;
  ValueNotifier<int?> get selectedAnswer => _selectedAnswer;

  void fetchingQuestions() async {
    if (_questionList.isEmpty) {
      final List<QuestionModel> list = await apiRepo.getQuestions();
      if (list.isNotEmpty) {
        _state = ScreenState.fetched;
        _questionList = list;
      } else {
        _state = ScreenState.noResponse;
      }
      notifyListeners();
    }
  }

  void onAnswerSelect(int index) {
    _selectedAnswer.value = index;
  }

  void nextClick(BuildContext context) {
    if (_selectedAnswer.value != null) {
      if (_questionList[_currentQution].correctAnswer.trim().toLowerCase() ==
          _questionList[_currentQution]
              .possibleAnswers[_selectedAnswer.value!]
              .trim()
              .toLowerCase()) {
        _correct++;
      } else {
        _wrong++;
      }
      if ((_questionList.length - 1) == _currentQution) {
        // Navigate to Result Screen
        AppMethod.pushReplacementRoute(
          context,
          QuizResultScreen(
            correct: _correct,
            total: _questionList.length,
          ),
        );
        disposeQuizState();
      } else {
        _currentQution++;
      }
      _selectedAnswer.value = null;
      notifyListeners();
    } else {
      CommonToast.showToast(ErrorMsg.selectTheAnswer);
    }
  }

  void disposeQuizState() {
    _currentQution = 0;
    _correct = 0;
    _wrong = 0;
    _selectedAnswer.value = null;
  }
}
