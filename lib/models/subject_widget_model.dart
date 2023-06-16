class SubjectWidgetModel {
  final String title;
  final String topic;
  final String initialQuestion; // true: question, false: answer

  const SubjectWidgetModel(
      {required this.title,
      required this.topic,
      required this.initialQuestion});
}
