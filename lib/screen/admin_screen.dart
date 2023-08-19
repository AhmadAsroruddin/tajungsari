import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'responsive_widget.dart';
import 'small_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    var containerWidth = 13 / 100 * deviceWidth;

    var deviceMargin = ResponsiveWidget.isMediumScreen(context)
        ? (5 / 100 * deviceWidth)
        : containerWidth;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 800) {
          return const SmallScreen();
        } else {
          return Admin(
            deviceWidth: deviceWidth,
            deviceMargin: deviceMargin,
            deviceHeight: deviceHeight,
          );
        }
      },
    );
  }
}

class Admin extends StatefulWidget {
  Admin({
    super.key,
    required this.deviceWidth,
    required this.deviceMargin,
    required this.deviceHeight,
  });

  final double deviceWidth;
  final double deviceMargin;
  final double deviceHeight;

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  html.File? imageFile;
  String? imageUrl;
  Uint8List? imageData;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  void _pickImage() {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      if (files!.length > 0) {
        setState(() {
          imageFile = files[0];
          _loadImage(imageFile!);
        });
      }
    });
  }

  void _uploadImage() async {
    print("object");
    if (imageFile == null) {
      print("No image selected.");
      return;
    }

    final url = await uploadImageToFirebase(imageFile!);
    setState(() {
      imageUrl = url;
    });
  }

  Future<Uint8List?> getFileData(html.File file) async {
    final reader = html.FileReader();
    reader.readAsArrayBuffer(file);
    await reader.onLoad.first;
    return reader.result as Uint8List?;
  }

  Future<void> _loadImage(html.File imageFiles) async {
    final data = await getFileData(imageFiles);
    setState(() {
      imageData = data;
    });
  }

  Future<String?> uploadImageToFirebase(html.File imageFile) async {
    try {
      // Get the reference to the Firebase Cloud Storage bucket
      final storage = firebase_storage.FirebaseStorage.instance;

      // Generate a unique filename for the image
      final fileName = DateTime.now().millisecondsSinceEpoch.toString() +
          "_" +
          imageFile.name;

      // Create a reference to the image file in the storage bucket
      final ref = storage.ref().child('images/$fileName');

      // Upload the file to Firebase Cloud Storage
      final uploadTask = ref.putBlob(imageFile);

      // Wait for the upload to complete and get the image URL
      final snapshot = await uploadTask;
      final imageUrl = await snapshot.ref.getDownloadURL();

      try {
        final CollectionReference imageCollection =
            FirebaseFirestore.instance.collection('ImageUrls');

        await imageCollection.add({
          'url': imageUrl,
          // Add any additional fields if needed
        });

        print('Image URL uploaded to Firestore successfully.');
      } catch (e) {
        print('Error uploading image URL to Firestore: $e');
      }
      print(imageUrl);
      return imageUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selamat Datang di Halaman Admin",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: deviceHeight * 0.1,
            ),
            Container(
              width: deviceWidth * 0.5,
              child: Column(
                children: <Widget>[
                  const Text(
                    "Tambah Agenda",
                    style: TextStyle(fontSize: 25),
                  ),
                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(labelText: 'Judul Agenda'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi judul agenda';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(labelText: 'Tanggal'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi tanggal';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(labelText: 'Lokasi'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon isi lokasi';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: deviceHeight * 0.05,
                  ),
                  Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: const Text('Select Image'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: _uploadImage,
                        child: Text('Upload Image'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      imageData != null
                          ? Image.memory(
                              imageData!,
                              height: 200,
                            )
                          : Container(
                              width: deviceWidth * 0.1,
                              height: deviceHeight * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                      SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Jangan lupa untuk menekan tombol\n upload setelah memilih gambar",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.05,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (imageUrl == null) {
                        return null;
                      }
                      try {
                        final CollectionReference agendaCollection =
                            FirebaseFirestore.instance.collection('agenda');
                        agendaCollection.add({
                          'imageUrl': imageUrl,
                          'judul': _titleController.text,
                          'lokasi': _locationController.text,
                          'tanggal': _dateController.text
                        });
                        print("berhasil");
                      } catch (e) {
                        print('Error uploading image URL to Firestore: $e');
                      }
                    },
                    child: Text("Tambah"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
