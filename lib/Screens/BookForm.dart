import 'package:flutter/material.dart';

class SellBookForm extends StatefulWidget {
  @override
  _SellBookFormState createState() => _SellBookFormState();
}

class _SellBookFormState extends State<SellBookForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define variables to store form data
  String _branch = '';
  String _subject = '';
  String _condition = '';
  double _year = 0.0;
  double _price = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sell Your Book',
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Scaffold(
          appBar: AppBar(
           backgroundColor:  Colors.teal,
            title: const Text('Sell Your Book'),
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
                      prefixIcon: const Icon(Icons.book),
                      labelText: 'Branch',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 220, 234, 233),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Branch';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _branch = value!;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.notes),
                      labelText: 'Subject',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 220, 234, 233),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter subject';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _subject = value!;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.numbers),
                      labelText: 'Year',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 220, 234, 233),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the year';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _year = double.parse(value!);
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
                      primary: Colors.teal, // Background color
                      onPrimary: Colors.white,
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
                        print('Title: $_year $_condition $_branch $_subject $_price');
                        // Add further logic for submitting the form data
                      }
                    },
                    child: const Text('Sell Book'),
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



