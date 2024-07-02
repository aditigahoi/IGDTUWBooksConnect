import 'package:books_connect/Screens/HomeScreen.dart';
// ignore: unused_import
import 'package:books_connect/Screens/Authentication/signupscreen.dart';
//import 'package:books_connect/Screens/applayout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SigninScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final size = AppLayout.getSize(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 246, 246),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(250, 237, 237, 0.936),
            Color.fromRGBO(251, 251, 251, 0.703)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
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
                          child: Image.asset('assets/image/booklogo.png')),

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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .white, // Set the background color as needed
                                  ),
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons
                                          .person, // Replace with your person icon
                                      size: 36.0, // Set the size as needed
                                      color:
                                          Colors.red, // Set the color as needed
                                    ),
                                    Icon(
                                      Icons
                                          .arrow_forward, // Replace with your arrow icon
                                      size: 20.0, // Set the size as needed
                                      color: Colors
                                          .orange, // Set the color as needed
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.0), // Adjust the spacing as needed

                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey)),
                              color: Colors.transparent,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter valid username';
                                      }
                                      return null;
                                    },
                                    enableSuggestions: true,
                                    autocorrect: true,
                                    controller: _emailTextController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Email Address',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const Padding(
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
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey)),
                              color: Colors.transparent,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter valid username';
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    controller: _passwordTextController,
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Password',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.lock_outline,
                                    color: Colors.orange,
                                    // Replace with your received call icon
                                    size: 24.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),

                      firebaseUIButton(context, "Sign In", () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage(
                                        email: _emailTextController.text,
                                      )));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have account?",
                              style: TextStyle(
                                  color: Color.fromARGB(179, 144, 4, 4))),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()));
                            },
                            child: const Text(
                              " Sign Up",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 80, 11, 11),
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
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
        ));
  }
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    // width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
