import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  final String id;
  final String name;
  final DateTime createdAt;
  final List<String> members;

  ChatRoom({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.members,
  });

  // Converts ChatRoom instance to a map for Firebase storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'members': members,
    };
  }

  // Creates a ChatRoom instance from a Firestore document
  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
      id: map['id'] as String,
      name: map['name'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      members: List<String>.from(map['members']),
    );
  }
}

class Message {
  final String id;
  final String senderId;
  final String senderName;
  final String text;
  final DateTime sentAt;

  Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.text,
    required this.sentAt,
  });

  // Converts Message instance to a map for Firebase storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'text': text,
      'sentAt': sentAt,
    };
  }

  // Creates a Message instance from a Firestore document
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      senderId: map['senderId'] as String,
      senderName: map['senderName'] as String,
      text: map['text'] as String,
      sentAt: (map['sentAt'] as Timestamp).toDate(),
    );
  }
}
