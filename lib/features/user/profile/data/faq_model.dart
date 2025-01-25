class FaqModel {
  final String question;
  final String answer;
  bool isExpanded;

  FaqModel(
      {required this.question, required this.answer, this.isExpanded = false});

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(question: json['question'], answer: json['answer']);
  }
}
