import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:portify/app_theme.dart';
import 'package:portify/widgets/custom_app_bar.dart';
import 'package:portify/widgets/rounded_icon_button.dart';

class UploadFormScreen extends StatefulWidget {
  @override
  _UploadFormScreenState createState() => _UploadFormScreenState();
}

class _UploadFormScreenState extends State<UploadFormScreen> {
  final ImagePicker _picker = ImagePicker();
  final Map<String, File?> _selectedImages = {
    'Selfie': null,
    'Vehicle Photo': null,
    'Driving License Front': null,
    'Driving License Back': null,
    'RC Book Front': null,
    'RC Book Back': null,
  };

  Future<void> _pickImage(String type) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImages[type] = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImages() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://oveego.in/Restapi/upload_images'),
    );

    _selectedImages.forEach((key, value) async {
      if (value != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
              key.replaceAll(' ', '_').toLowerCase(), value!.path),
        );
      }
    });

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Upload successful');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload successful')),
      );
    } else {
      print('Upload failed');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Upload Documents'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _selectedImages.keys.length,
                itemBuilder: (context, index) {
                  String key = _selectedImages.keys.elementAt(index);
                  return GestureDetector(
                    onTap: () => _pickImage(key),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: _selectedImages[key] != null
                              ? Image.file(_selectedImages[key]!,
                                  width: 50, height: 50, fit: BoxFit.cover)
                              : const Icon(
                                  Icons.add_a_photo,
                                  color: AppTheme.primaryColor,
                                ),
                          title: Text(key),
                          trailing: _selectedImages[key] != null
                              ? Icon(Icons.check, color: Colors.green)
                              : null,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            RoundedIconButton(
              text: 'Upload Documents',
              leadingIcon: Icons.upload_file,
              onTap: _uploadImages,
            )
          ],
        ),
      ),
    );
  }
}
