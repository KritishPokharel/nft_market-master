import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RedemptionForm extends StatefulWidget {
  @override
  _RedemptionFormState createState() => _RedemptionFormState();
}

class _RedemptionFormState extends State<RedemptionForm> {
  final _formKey = GlobalKey<FormState>();
  double? _amount;
  String? _reason;
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redemption Form'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: 'Amount to Redeem',
                  hintText: 'Enter amount in USD',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount to redeem';
                  }
                  final amount = double.tryParse(value);
                  if (amount == null) {
                    return 'Please enter a valid amount';
                  }
                  if (amount < 0) {
                    return 'Amount must be greater than zero';
                  }
                  _amount = amount;
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Reason for Redemption',
                  hintText: 'Enter a reason for the redemption',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a reason for the redemption';
                  }
                  _reason = value;
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Proof of Redemption (Optional)',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  if (_image == null)
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Upload Image'),
                    )
                  else
                    Image.file(_image!),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform redemption
                    // Code to perform redemption goes here
                    // Reset form
                    _formKey.currentState!.reset();
                    setState(() {
                      _image = null;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Redemption Successful')),
                    );
                  }
                },
                child: Text('Redeem'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
