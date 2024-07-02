import 'package:flutter/material.dart';

class sellDrafterForm extends StatefulWidget {
  @override
  _sellDrafterFormState createState() => _sellDrafterFormState();
}

class _sellDrafterFormState extends State<sellDrafterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define variables to store form data
  String _name = '';
  String _condition = '';
  double _price = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sell Your Drafter',
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Sell Your Drafter'),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Name of Seller',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 220, 234, 233),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.format_list_numbered),
                      labelText: 'Description',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 220, 234, 233),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _condition = value!;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.attach_money),
                      labelText: 'Price',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 220, 234, 233),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the price';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _price = double.parse(value!);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.teal, // Background color
                      backgroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Process the form data (e.g., submit to a backend server)
                        // You can add your logic here
                        print(
                            'Title: $_name, Condition: $_condition, Price: $_price');
                        // Add further logic for submitting the form data
                      }
                    },
                    child: const Text('Sell'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
