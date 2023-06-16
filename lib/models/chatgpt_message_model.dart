class ChatgptMessageModel {
  final String text;
  final bool flag; // true: question, false: answer

  const ChatgptMessageModel({required this.text, required this.flag});
}
