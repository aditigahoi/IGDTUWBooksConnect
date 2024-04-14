import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Define _selectedBranch variable
const List<String> _branches = ['Branch', 'CSE', 'ECE', 'IT', 'MAE'];

class SellBookForm extends StatefulWidget {
  @override
  _SellBookFormState createState() => _SellBookFormState();
}

class _SellBookFormState extends State<SellBookForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late User _currentUser; // Store the current user

  // Define variables to store form data
  String _subject = '';
  String _condition = '';
  double _year = 0.0;
  double _price = 0.0;

  // Define _branches variable
  String _selectedBranch = _branches.isNotEmpty ? _branches[0] : '';

  @override
  void initState() {
    super.initState();
    // Retrieve the current user after the widget has been initialized
    _currentUser = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
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
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.book),
                  labelText: 'Branch',
                  filled: true,
                  fillColor: Colors.red.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                value: _selectedBranch,
                dropdownColor: Colors.red.shade100,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedBranch = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a branch';
                  }
                  return null;
                },
                items: _branches.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.notes),
                  labelText: 'Subject',
                  filled: true,
                  fillColor: Colors.red.shade300,
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
                  fillColor: Colors.red.shade300,
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
                  fillColor: Colors.red.shade300,
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
                  fillColor: Colors.red.shade300,
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
                  primary: Colors.red.shade400, // Background color
                  onPrimary: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                ),
                onPressed: _saveFormDataToFirestore,
                child: const Text('Sell Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveFormDataToFirestore() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        await users.add({
          'userId': _currentUser.uid,
          'email': _currentUser.email, // Save the email ID
          'branch': _selectedBranch,
          'subject': _subject,
          'price': _price,
          'year': _year,
          'condition': _condition,
        });
        print("User Added");

        // Clear the form fields
        _formKey.currentState!.reset();

        // Show a Snackbar to indicate success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Book details added successfully')),
        );
      } catch (error) {
        print("Failed to add user: $error");
      }
    }
  }
}
