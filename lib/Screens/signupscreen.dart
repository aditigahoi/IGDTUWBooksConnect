import 'package:books_connect/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 246, 246),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  // Centered Logo
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'image/booklogo.png', // Replace with the path to your image asset
                        width: 350.0, // Set the width as needed
                        height: 250.0, // Set the height as needed
                      )),

                  SizedBox(height: 20.0), // Adjust the spacing as needed

                  //break
                  Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width:
                                  70.0, // Increase the size of the circular background as needed
                              height:
                                  70.0, // Increase the size of the circular background as needed
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .white, // Set the background color as needed
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person, // Replace with your person icon
                                  size: 36.0, // Set the size as needed
                                  color: Colors.red, // Set the color as needed
                                ),
                                Icon(
                                  Icons
                                      .arrow_forward, // Replace with your arrow icon
                                  size: 20.0, // Set the size as needed
                                  color:
                                      Colors.orange, // Set the color as needed
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0), // Adjust the spacing as needed

                  // "Enter phone number" input with received call icon
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter Email Address',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.mail_outline,
                            color: Colors.orange,
                            // Replace with your received call icon
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // dashboard
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    },
                    child: Text('Continue'),
                  ),

                  SizedBox(height: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('By continuing, you agree to our'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Implement "Terms" link logic here
                            },
                            child: Text('Terms & Conditions'),
                          ),
                          Text('and'),
                          TextButton(
                            onPressed: () {
                              // Implement "Privacy Policy" link logic here
                            },
                            child: Text('Privacy Policy'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
