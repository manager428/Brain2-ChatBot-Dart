import 'dart:convert';
import 'package:chat/models/history_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GptService {
  static const String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  static Future<String?> getAnswer(String question, String topic) async {
    String prompt = '$question This question are related with $topic topic';

    final Map<String, dynamic> requestBody = <String, dynamic>{
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": prompt}
      ],
      'temperature': 0.7,
      'max_tokens': 2048,
      'top_p': 1,
      'frequency_penalty': 0.5,
      'presence_penalty': 0.5
    };

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Authorization': 'Bearer ${dotenv.env['CHATGPT_API_KEY']}',
        'Content-Type': 'application/json'
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      return responseBody['choices'][0]['message']['content'];
    } else {
      return null;
    }
  }

  static Future<String?> addHistory(
      String question, String answer, String date) async {
    final db = FirebaseFirestore.instance;
    final docRef = db.collection('histories').doc();
    User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    History history = History(
        question: question,
        answer: answer,
        date: date,
        id: docRef.id,
        uid: uid);

    await docRef.set(history.toJson()).then(
        // ignore: avoid_print
        (value) => print("history added successfully!"),
        // ignore: avoid_print
        onError: (e) => print("Error adding history: $e"));
    return null;
  }

  static Future<void> deleteHisotry(String documentId) async {
    await FirebaseFirestore.instance
        .collection('histories')
        .doc(documentId)
        .delete();
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getSuggestions() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('suggestions').get();

    return querySnapshot;
  }
}
