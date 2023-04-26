class QuestionModel {
  final int id;
  final String question;
  final List<String> possibleAnswers;
  final String correctAnswer;

  QuestionModel({
    required this.id,
    required this.question,
    required this.possibleAnswers,
    required this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map data) => QuestionModel(
        id: data["id"],
        question: data["question"],
        possibleAnswers:
            (data["possibleAnswers"] != null && data["possibleAnswers"] is List)
                ? (data["possibleAnswers"] as List)
                    .map((e) => e.toString())
                    .toList()
                : [],
        correctAnswer: data["correctAnswer"].toString(),
      );
}
