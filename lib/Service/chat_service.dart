import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<void> sendMessage(String receiverId, String message) async {
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    try {
      // Fetch the receiver's email
      String receiverEmail = await getReceiverEmail(receiverId);

      Message newMessage = Message(
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        receiverId: receiverId,
        timestamp: timestamp,
        message: message,
      );

      List<String> ids = [currentUserId, receiverId];
      ids.sort();
      String chatRoomId = ids.join("_");

      await _fireStore.collection('chat_rooms').doc(chatRoomId).set({
        'members': ids,
        'emails': {
          currentUserId: currentUserEmail,
          receiverId: receiverEmail,
        },
      }, SetOptions(merge: true));

      await _fireStore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .add(newMessage.toMap());

      print('Message sent successfully');
    } catch (e) {
      print('Failed to send message: $e');
    }
  }

  Future<String> getReceiverEmail(String receiverId) async {
    try {
      DocumentSnapshot userDoc =
          await _fireStore.collection('users').doc(receiverId).get();
      return userDoc['email'];
    } catch (e) {
      print('Failed to get receiver email: $e');
      return 'unknown@example.com';
    }
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getUserChatRooms(String userId) {
    return _fireStore
        .collection('chat_rooms')
        .where('members', arrayContains: userId)
        .snapshots();
  }
}

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.timestamp,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ChatService extends ChangeNotifier {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//   Future<void> sendMessage(String receiverId, String message) async {
//     final String currentUserId = _firebaseAuth.currentUser!.uid;
//     final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
//     final Timestamp timestamp = Timestamp.now();

//     Message newMessage = Message(
//       senderId: currentUserId,
//       senderEmail: currentUserEmail,
//       receiverId: receiverId,
//       timestamp: timestamp,
//       message: message,
//     );

//     List<String> ids = [currentUserId, receiverId];
//     ids.sort();
//     String chatRoomId = ids.join("_");

//     await _fireStore.collection('chat_rooms').doc(chatRoomId).set({
//       'members': ids,
//       'emails': {
//         currentUserId: currentUserEmail,
//         receiverId:
//             'receiver@example.com', // Replace with actual receiver email
//       },
//     });

//     await _fireStore
//         .collection('chat_rooms')
//         .doc(chatRoomId)
//         .collection('messages')
//         .add(newMessage.toMap());
//   }

//   Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
//     List<String> ids = [userId, otherUserId];
//     ids.sort();
//     String chatRoomId = ids.join("_");

//     return _fireStore
//         .collection('chat_rooms')
//         .doc(chatRoomId)
//         .collection('messages')
//         .orderBy('timestamp', descending: false)
//         .snapshots();
//   }

//   Stream<QuerySnapshot> getUserChatRooms(String userId) {
//     return _fireStore
//         .collection('chat_rooms')
//         .where('members', arrayContains: userId)
//         .snapshots();
//   }
// }

// class Message {
//   final String senderId;
//   final String senderEmail;
//   final String receiverId;
//   final String message;
//   final Timestamp timestamp;

//   Message({
//     required this.senderId,
//     required this.senderEmail,
//     required this.receiverId,
//     required this.timestamp,
//     required this.message,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'senderId': senderId,
//       'senderEmail': senderEmail,
//       'receiverId': receiverId,
//       'message': message,
//       'timestamp': timestamp,
//     };
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class ChatService extends ChangeNotifier {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//   Future<void> sendMessage(String receiverId, String message) async {
//     final String currentUserId = _firebaseAuth.currentUser!.uid;
//     final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
//     final Timestamp timestamp = Timestamp.now();

//     Message newMessage = Message(
//       senderId: currentUserId,
//       senderEmail: currentUserEmail,
//       receiverId: receiverId,
//       timestamp: timestamp,
//       message: message,
//     );

//     List<String> ids = [currentUserId, receiverId];
//     ids.sort();
//     String chatRoomId = ids.join("_");

//     await _fireStore
//         .collection('chat_rooms')
//         .doc(chatRoomId)
//         .collection('messages')
//         .add(newMessage.toMap());
//   }

//   Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
//     List<String> ids = [userId, otherUserId];
//     ids.sort();
//     String chatRoomId = ids.join("_");

//     return _fireStore
//         .collection('chat_rooms')
//         .doc(chatRoomId)
//         .collection('messages')
//         .orderBy('timestamp', descending: false)
//         .snapshots();
//   }
// }

// class Message {
//   final String senderId;

//   final String senderEmail;

//   final String receiverId;
//   final String message;

//   final Timestamp timestamp;
//   Message({
//     required this.senderId,
//     required this.senderEmail,
//     required this.receiverId,
//     required this.timestamp,
//     required this.message,
//   });

// // convert to a map
//   Map<String, dynamic> toMap() {
//     return {
//       'senderId': senderId,
//       'senderEmail': senderEmail,
//       'receiverId': receiverId,
//       'message': message,
//       'timestamp': timestamp,
//     };
//   }
// }


