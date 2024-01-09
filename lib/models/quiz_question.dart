class QuizQuestion {
  const QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    final t = List.of(answers);
    t.shuffle();
    return t;
  }
}
