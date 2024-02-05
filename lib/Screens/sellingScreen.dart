import 'package:books_connect/Screens/labCoatForm.dart';
import 'package:books_connect/Screens/notesForm.dart';
import 'package:flutter/material.dart';
import 'package:books_connect/Screens/DrafterForm.dart';
import 'package:books_connect/Screens/BookForm.dart';

class SellingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      appBar: AppBar(
        title: Text('What do you want to sell?'),
        backgroundColor: Colors.red.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCategoryTile(context, 'Books', Icons.book_online,
                Colors.red.shade300, SellBookForm()),
            _buildCategoryTile(context, 'Notes', Icons.note,
                Colors.red.shade300, sellNotesForm()),
            _buildCategoryTile(context, 'Lab Coat', Icons.work,
                Colors.red.shade300, sellLCForm()),
            _buildCategoryTile(context, 'Drafter', Icons.edit,
                Colors.red.shade300, sellDrafterForm()),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile(BuildContext context, String title, IconData icon,
      Color tileColor, Widget destinationScreen) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 33, 65, 243),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        tileColor: tileColor,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        },
      ),
    );
  }
}
