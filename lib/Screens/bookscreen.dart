import 'package:books_connect/Screens/chatscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Book {
  final double price;
  final String branch;
  final String condition;
  final String subject;
  final int year;

  Book({
    required this.price,
    required this.branch,
    required this.condition,
    required this.subject,
    required this.year,
  });
}

class BookListScreen extends StatefulWidget {
  const BookListScreen({required this.branch});
  final String branch;

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  Map<String, dynamic>? userMap;
  late Stream<QuerySnapshot> _stream;
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance
        .collection('users')
        .where('branch', isEqualTo: widget.branch) // Filter by branch
        .snapshots();
  }

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: const Text('Book List'),
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final books = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Book(
              price: data['price'],
              branch: data['branch'],
              condition: data['condition'],
              subject: data['subject'],
              year: data['year'],
            );
          }).toList();

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Card(
                color: Colors.red.shade300,
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // Left side - Book Image
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color:
                              Colors.lightBlue, // here we need to put for pic
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Right side - Book Details and Chat Button
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Branch: ${book.branch}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Description: ${book.condition}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Subject: ${book.subject}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Year: ${book.year}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Price: \$${book.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Right side - Chat Button
                      ElevatedButton(
                        onPressed: () async {
                          Map<String, String>? sellerInfo =
                              await getSellerInfo(book);
                          if (sellerInfo != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(
                                  recieverUid: sellerInfo['userId']!,
                                  recieverEmail: sellerInfo['email']!,
                                ),
                              ),
                            );
                          } else {
                            print('Seller information is null');
                          }
                        },
                        child: const Text('Chat with seller'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Future<Map<String, String>?> getSellerInfo(Book book) async {
  Map<String, String>? sellerInfo;
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('users')
      .where('branch', isEqualTo: book.branch)
      .where('condition', isEqualTo: book.condition)
      .where('price', isEqualTo: book.price)
      .where('subject', isEqualTo: book.subject)
      .where('year', isEqualTo: book.year)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    var data = querySnapshot.docs.first.data() as Map<String, dynamic>;
    var userId = data['userId'];
    var email = data['email'];
    sellerInfo = {'userId': userId, 'email': email};
  }
  return sellerInfo;
}

// class BookListScreen extends StatelessWidget {
//   final List<Book> booklist = [
//     Book("Book 1", "Author 1", 19.99, "Description 1", "Seller 1"),
//     Book("Book 2", "Author 2", 24.99, "Description 2", "Seller 2"),
//     Book("Book 3", "Author 3", 14.99, "Description 3", "Seller 3"),
//     // Add more books as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book List'),
//       ),
//       body: ListView.builder(
//         itemCount: booklist.length,
//         itemBuilder: (context, index) {
//           return BookBlock(booklist[index]);
//         },
//       ),
//     );
//   }
// }

// class BookBlock extends StatelessWidget {
//   final Book book;
//   BookBlock(this.book);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             // Left side - Book Image
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                       'image/booklogo.png'), // Replace with the actual image path
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             SizedBox(width: 16), // Add spacing between image and details
//             // Right side - Book Details and Chat Button
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     book.title,
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'By ${book.author}',
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Price: \$${book.price.toStringAsFixed(2)}',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Description:',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     book.description,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Sold by: ${book.sellerName}',
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             // Right side - Chat Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ChatScreen(book: book),
//                   ),
//                 );
//               },
//               child: Text('Chat with seller'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Book {
//   final String title;
//   final String author;
//   final double price;
//   final String description;
//   final String sellerName;

//   Book(this.title, this.author, this.price, this.description, this.sellerName);
// }
