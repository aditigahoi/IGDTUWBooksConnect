import 'package:books_connect/Screens/chatscreen.dart';
import 'package:flutter/material.dart';

class BookListScreen extends StatelessWidget {
  final List<Book> booklist = [
    Book("Book 1", "Author 1", 19.99, "Description 1", "Seller 1"),
    Book("Book 2", "Author 2", 24.99, "Description 2", "Seller 2"),
    Book("Book 3", "Author 3", 14.99, "Description 3", "Seller 3"),
    // Add more books as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView.builder(
        itemCount: booklist.length,
        itemBuilder: (context, index) {
          return BookBlock(booklist[index]);
        },
      ),
    );
  }
}

class BookBlock extends StatelessWidget {
  final Book book;
  BookBlock(this.book);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Left side - Book Image
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'image/booklogo.png'), // Replace with the actual image path
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 16), // Add spacing between image and details
            // Right side - Book Details and Chat Button
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'By ${book.author}',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Price: \$${book.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    book.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sold by: ${book.sellerName}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Right side - Chat Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(book: book),
                  ),
                );
              },
              child: Text('Chat with seller'),
            ),
          ],
        ),
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final double price;
  final String description;
  final String sellerName;

  Book(this.title, this.author, this.price, this.description, this.sellerName);
}
