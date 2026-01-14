import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) return;

    // 1️⃣ Upload to Firebase Storage
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageRef = FirebaseStorage.instance.ref().child(
      'images/$fileName.jpg',
    );
    await storageRef.putFile(_image!);

    // 2️⃣ Get download URL
    String downloadURL = await storageRef.getDownloadURL();

    // 3️⃣ Save URL to Firestore
    await FirebaseFirestore.instance.collection('images').add({
      'image': downloadURL,
      'uploaded_at': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Upload successful!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Image")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? Text("No image selected") : Image.file(_image!),
            ElevatedButton(onPressed: _pickImage, child: Text("Pick Image")),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text("Upload to Firebase"),
            ),
          ],
        ),
      ),
    );
  }
}
