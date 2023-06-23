class History {
  final String question;
  final String answer;
  final String date;
  final String id;
  final String uid;

  History(
      {required this.question,
      required this.answer,
      required this.date,
      required this.id,
      required this.uid});

  Map<String, dynamic> toJson() => {
        'question': question,
        'answer': answer,
        'date': date,
        'id': id,
        'uid': uid
      };
}
