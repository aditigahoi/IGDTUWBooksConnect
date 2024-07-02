import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:books_connect/Service/chat_service.dart'; // Adjust this path as necessary
import 'package:books_connect/Screens/chatscreen.dart'; // Adjust this path as necessary

class AllChatScreen extends StatefulWidget {
  @override
  _AllChatScreenState createState() => _AllChatScreenState();
}

class _AllChatScreenState extends State<AllChatScreen> {
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: Text('All Chats'),
      ),
      body: StreamBuilder(
        stream: _chatService.getUserChatRooms(_firebaseAuth.currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No chats found.'));
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              List<String> members = List<String>.from(data['members']);
              String otherUserId = members
                  .firstWhere((uid) => uid != _firebaseAuth.currentUser!.uid);
              String otherUserEmail =
                  data['emails'][otherUserId] ?? 'Unknown User';

              return ListTile(
                title: Text(otherUserEmail),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        recieverUid: otherUserId,
                        recieverEmail: otherUserEmail,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
