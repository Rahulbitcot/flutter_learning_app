import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.id, required this.userName});
  final String id;
  final String userName;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Group Chat"),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('messages').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("No messages available"));
              }

              // Sort the messages based on 'createdAt' timestamp locally
              List<DocumentSnapshot> messages = snapshot.data!.docs;
              messages.sort((a, b) {
                Timestamp timestampA = a['createdAt'];
                Timestamp timestampB = b['createdAt'];
                return timestampB.compareTo(timestampA);
              });

              return ListView.builder(
                itemCount: messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  var messageData = messages[index];
                  String messageText = messageData['message'] ?? "No message";
                  Timestamp createdAt = messageData['createdAt'];
                  String senderId = messageData['senderId'];
                  String userName = messageData['name'];

                  bool isSender = senderId == widget.id;

                  return Align(
                    alignment:
                        isSender ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      margin: isSender
                          ? const EdgeInsets.only(left: 180, right: 8, top: 4)
                          : const EdgeInsets.only(right: 180, left: 8, top: 4),
                      decoration: BoxDecoration(
                        color: isSender
                            ? Colors.yellow[100]
                            : const Color.fromARGB(255, 184, 237, 239),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          crossAxisAlignment: isSender
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              messageText,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              DateFormat('HH:mm').format(createdAt.toDate()),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    if (messageController.text.isNotEmpty) {
                      sendMessage();
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendMessage() async {
    final messageText = messageController.text.trim();

    if (messageText.isNotEmpty) {
      try {
        // Make sure the path here matches what you're using in StreamBuilder
        await FirebaseFirestore.instance.collection('messages').add({
          'message': messageText,
          'createdAt': Timestamp.now(),
          'senderId': widget.id,
          'name': widget.userName,
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message: $e')),
        );
      }
    }
  }
}
