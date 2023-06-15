// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Camera extends StatefulWidget {
//   const Camera({Key? key}) : super(key: key);

//   @override
//   _CameraState createState() => _CameraState();
// }

// class _CameraState extends State<Camera> {
//   final ImagePicker _picker = ImagePicker();
//   File? _imageFile;

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     setState(() {
//       _imageFile = pickedFile != null ? File(pickedFile.path) : null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Take a Picture'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_imageFile != null)
//               Image.file(_imageFile!)
//             else
//               Icon(Icons.image, size: 100.0),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.camera),
//               child: Text('Take Picture'),
//             ),
//             SizedBox(height: 10.0),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.gallery),
//               child: Text('Choose from Gallery'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
