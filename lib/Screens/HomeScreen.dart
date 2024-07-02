import 'package:books_connect/Screens/FindBooks/bookscreen.dart';
import 'package:books_connect/Screens/allChatScreen.dart';
import 'package:books_connect/Screens/sellingScreen.dart';
import 'package:flutter/material.dart';
import 'package:books_connect/Screens/BookForm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.email});
  final String email;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(100.0), // Adjust the height as needed
        // clipper: MyClipper(),
        child: AppBar(
          title: const Text(
            'IGDTUW BooksConnect',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red.shade400,
          //backgroundColor: Colors.teal,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.zero,
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.zero,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Caterogies',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.red.shade300,
                elevation: 5,
                shadowColor: Colors.black,
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    width: double.infinity, // Set a width for the card
                    height: 180, // Set a height for the card
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            'Find Books Here',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomInkWell(
                                col: Colors.pink,
                                labelText: 'Computer Science',
                                destinationScreen:
                                    BookListScreen(branch: 'CSE'),
                              ),
                              SizedBox(width: 10),
                              CustomInkWell(
                                col: Colors.green,
                                labelText: 'Information Technology',
                                destinationScreen: BookListScreen(branch: 'IT'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomInkWell(
                                col: Colors.teal,
                                labelText: 'Electronics Communication',
                                destinationScreen:
                                    BookListScreen(branch: 'ECE'),
                              ),
                              SizedBox(width: 10),
                              CustomInkWell(
                                col: Colors.lime,
                                labelText: 'Mechanics and Automation',
                                destinationScreen:
                                    BookListScreen(branch: 'MAE'),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.red.shade300,
                elevation: 5,
                shadowColor: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity, // Set a width for the card
                  height: 200, // Set a height for the card
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'Find Notes Here',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomInkWell(
                              labelText: 'Computer Science',
                              destinationScreen: SellBookForm(),
                              col: Colors.amber,
                            ),
                            SizedBox(width: 10),
                            CustomInkWell(
                              labelText: 'Information Technology',
                              destinationScreen: SellBookForm(),
                              col: Colors.cyan,
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomInkWell(
                              col: Colors.teal,
                              labelText: 'Electronics Communication',
                              destinationScreen: SellBookForm(),
                            ),
                            SizedBox(width: 10),
                            CustomInkWell(
                              col: Colors.purple,
                              labelText: 'Information Technology',
                              destinationScreen: SellBookForm(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.red.shade300,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity, // Set a width for the card
                  height: 150, // Set a height for the card
                  child: Center(
                    child: Text(
                      'Find Lab Coats Here',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.red.shade300,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10)),
                    width: double.infinity, // Set a width for the card
                    height: 150,
                    child: const InkWell(
                      child: Center(
                        child: Text(
                          'Drafter & Engineering Drawing Material ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SellingScreen()),
          );
        },
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          //child:Icon(Icons.add,color: Colors.black26),
          child: Text(
            'Sell',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red.shade400,
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                //for home
              },
              child: const Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllChatScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.chat,
                color: Colors.white,
                size: 30,
              ),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                //for details
              },
              child: const Icon(
                Icons.note,
                color: Colors.white,
                size: 30,
              ),
            ),
            label: 'Details',
          ),
        ],
      ),
    );
  }
}

class CustomInkWell extends StatelessWidget {
  final String labelText;
  final Widget destinationScreen;
  final Color col;

  CustomInkWell(
      {required this.labelText,
      required this.destinationScreen,
      required this.col});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Perform navigation when the InkWell is tapped
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => destinationScreen));
        },
        borderRadius: BorderRadius.circular(10),
        child: Center(
          child: Container(
            height: 60,
            width: 160,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: col,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              labelText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
