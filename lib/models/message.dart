import 'dart:convert';

import 'package:scholar_chat/constants.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String message;
  final String id;
  Message(
    this.message,
    this.id,
  );

  factory Message.fromJson(jsonData) {
    return Message(jsonData["message"] , jsonData["id"]);
  }
}
