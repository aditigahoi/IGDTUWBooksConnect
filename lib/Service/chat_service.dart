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

    await _fireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
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

// convert to a map
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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// // Define _selectedBranch variable
// const List<String> _branches = ['CSE', 'ECE', 'IT', 'MAE'];

// class SellBookForm extends StatefulWidget {
//   @override
//   _SellBookFormState createState() => _SellBookFormState();
// }

// class _SellBookFormState extends State<SellBookForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//   late User _currentUser; // Store the current user

//   // Define variables to store form data
//   String _subject = '';
//   String _condition = '';
//   double _year = 0.0;
//   double _price = 0.0;

//   // Define _branches variable
//   String _selectedBranch = _branches.isNotEmpty ? _branches[0] : '';

//   @override
//   void initState() {
//     super.initState();
//     // Retrieve the current user after the widget has been initialized
//     _currentUser = FirebaseAuth.instance.currentUser!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sell Your Book',
//       debugShowCheckedModeBanner: false,
//       home: Center(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.teal,
//             title: const Text('Sell Your Book'),
//             leading: IconButton(
//               onPressed: () => Navigator.pop(context),
//               icon: const Icon(Icons.arrow_back),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.book),
//                       labelText: 'Branch',
//                       filled: true,
//                       fillColor: const Color.fromARGB(255, 220, 234, 233),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     value: _selectedBranch,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedBranch = newValue!;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select a branch';
//                       }
//                       return null;
//                     },
//                     items:
//                         _branches.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.notes),
//                       labelText: 'Subject',
//                       filled: true,
//                       fillColor: const Color.fromARGB(255, 220, 234, 233),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter subject';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _subject = value!;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.numbers),
//                       labelText: 'Year',
//                       filled: true,
//                       fillColor: const Color.fromARGB(255, 220, 234, 233),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the year';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _year = double.parse(value!);
//                     },
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.format_list_numbered),
//                       labelText: 'Description',
//                       filled: true,
//                       fillColor: const Color.fromARGB(255, 220, 234, 233),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the description';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _condition = value!;
//                     },
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.attach_money),
//                       labelText: 'Price',
//                       filled: true,
//                       fillColor: const Color.fromARGB(255, 220, 234, 233),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the price';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       _price = double.parse(value!);
//                     },
//                   ),
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.teal, // Background color
//                       onPrimary: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       padding: EdgeInsets.all(16.0),
//                     ),
//                     onPressed: _saveFormDataToFirestore,
//                     child: const Text('Sell Book'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _saveFormDataToFirestore() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       try {
//         await users.add({
//           'userId': _currentUser.uid, // Store user's unique ID
//           'branch': _selectedBranch,
//           'subject': _subject,
//           'price': _price,
//           'year': _year,
//           'condition': _condition,
//         });
//         print("User Added");

//         // Clear the form fields
//         _formKey.currentState!.reset();

//         // Show a Snackbar to indicate success
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Book details added successfully')),
//         );
//       } catch (error) {
//         print("Failed to add user: $error");
//       }
//     }
//   }
// }
