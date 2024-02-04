import 'package:books_connect/Screens/bookscreen.dart';
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
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('IGDTUW BooksConnect'),
      //   toolbarHeight: 70.0,
      //   backgroundColor: Colors.teal,
      // ),
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
          backgroundColor: Color(0xFF8C1C13),
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
              Text(
                'Caterogies',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: const Color(0xFFBF4342),
                elevation: 5,
                shadowColor: Colors.black,
                child: Container(
                  width: double.infinity, // Set a width for the card
                  height: 150, // Set a height for the card
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'Find Books Here',
                          style: TextStyle(
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
                              destinationScreen: BookListScreen(branch: 'CSE'),
                            ),
                            SizedBox(width: 10),
                            CustomInkWell(
                              labelText: 'Information Technology',
                              destinationScreen: BookListScreen(branch: 'IT'),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomInkWell(
                              labelText: 'Electronics Communication',
                              destinationScreen: BookListScreen(branch: 'ECE'),
                            ),
                            SizedBox(width: 10),
                            CustomInkWell(
                              labelText: 'Mechanics and Automation',
                              destinationScreen: BookListScreen(branch: 'MAE'),
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
                color: const Color(0xFFBF4342),
                elevation: 5,
                shadowColor: Colors.black,
                child: Container(
                  width: double.infinity, // Set a width for the card
                  height: 150, // Set a height for the card
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'Find Notes Here',
                          style: TextStyle(
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
                            ),
                            SizedBox(width: 10),
                            CustomInkWell(
                              labelText: 'Information Technology',
                              destinationScreen: SellBookForm(),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomInkWell(
                              labelText: 'Electronics Communication',
                              destinationScreen: SellBookForm(),
                            ),
                            SizedBox(width: 10),
                            CustomInkWell(
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
                color: const Color(0xFFBF4342),
                child: Container(
                  width: double.infinity, // Set a width for the card
                  height: 150, // Set a height for the card
                  child: Center(
                    child: Text(
                      'Find Lab Coats Here',
                      style: TextStyle(
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
                color: Color(0xFFBF4342),
                child: Container(
                    width: double.infinity, // Set a width for the card
                    height: 150,
                    child: const InkWell(
                      child: Center(
                        child: Text(
                          'Drafter & Engineering Drawing Material ',
                          style: TextStyle(
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xFF21222D),
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Color(0xFF21222D),
              size: 30,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Color(0xFF21222D),
              size: 30,
            ),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}

class CustomInkWell extends StatelessWidget {
  final String labelText;
  final Widget destinationScreen;

  CustomInkWell({required this.labelText, required this.destinationScreen});

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
            height: 50,
            width: 200,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
