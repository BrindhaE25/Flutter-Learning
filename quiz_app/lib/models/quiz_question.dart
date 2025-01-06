
class QuizQuestion {
  const QuizQuestion(this.text, this.answer);

  final String text;
  final List<String> answer;

  List<String> shuffleAnswers() {
    final answers = List.of(answer);
    answers.shuffle();
    return answers;
  }
}
