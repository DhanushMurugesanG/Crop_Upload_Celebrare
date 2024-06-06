// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const SizedBox(
//                 height:
//                     20), // Add some space between the counter and the button
//             ElevatedButton(
//               onPressed: () {
//                 // Add your onPressed code here!
//                 print('Upload Photo button pressed');
//               },
//               child: const Text('Upload Photo'),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
//

// //3.
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key})
//       : super(key: key); // Added 'Key?' to avoid null safety issue

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key})
//       : super(key: key); // Added 'Key?' to avoid null safety issue

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File?
//       _selectedImage; // Moved from MyHomePage to _MyHomePageState to manage state

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Image / Icon'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 pickImageFromGallery();
//                 print('Upload Photo button pressed');
//               },
//               child: const Text('Upload Photo'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             _selectedImage != null
//                 ? Image.file(
//                     _selectedImage!) // Added null check to avoid null pointer exception
//                 : const Text(""),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> pickImageFromGallery() async {
//     final returnedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (returnedImage != null) {
//       setState(() {
//         _selectedImage = File(returnedImage.path);
//       });
//     }
//   }
// }

// //4
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File? _selectedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Image / Icon'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 pickImageFromGallery();
//                 print('Upload Photo button pressed');
//               },
//               child: const Text('Upload Photo'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             _selectedImage != null
//                 ? Image.file(_selectedImage!)
//                 : const Text("No Image Selected"),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> pickImageFromGallery() async {
//     try {
//       final returnedImage =
//           await ImagePicker().pickImage(source: ImageSource.gallery);

//       if (returnedImage != null) {
//         File? croppedImage = await cropImage(File(returnedImage.path));

//         if (croppedImage != null) {
//           setState(() {
//             _selectedImage = croppedImage;
//           });
//         }
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error picking image: $e')),
//       );
//     }
//   }

//   Future<File?> cropImage(File imageFile) async {
//     try {
//       CroppedFile? croppedFile = await ImageCropper().cropImage(
//         sourcePath: imageFile.path,
//         aspectRatioPresets: [
//           CropAspectRatioPreset.square,
//           CropAspectRatioPreset.ratio3x2,
//           CropAspectRatioPreset.original,
//           CropAspectRatioPreset.ratio4x3,
//           CropAspectRatioPreset.ratio16x9,
//         ],
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.blue,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false,
//           ),
//         ],
//       );

//       if (croppedFile != null) {
//         return File(croppedFile.path);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error cropping image: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error cropping image: $e')),
//       );
//       return null;
//     }
//   }
// }

//5

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File? _selectedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Image / Icon'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 pickImageFromGallery();
//                 print('Upload Photo button pressed');
//               },
//               child: const Text('Upload Photo'),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             _selectedImage != null
//                 ? Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Image.file(_selectedImage!),
//                       Positioned.fill(
//                         child: Image.asset(
//                           'assets/frames/1Frame.png', // Your frame image asset path
//                           fit: BoxFit.fitWidth,
//                         ),
//                       ),
//                     ],
//                   )
//                 : const Text(""),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> pickImageFromGallery() async {
//     final returnedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (returnedImage != null) {
//       setState(() {
//         _selectedImage = File(returnedImage.path);
//       });
//     }
//   }
// }

//6

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Image / Icon'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                pickImageFromGallery();
                print('Upload Photo button pressed');
              },
              child: const Text('Upload Photo'),
            ),
            const SizedBox(
              height: 20,
            ),
            _selectedImage != null
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/frames/frame.png', // Your frame image asset path
                        fit: BoxFit
                            .cover, // Adjust this to match your requirement
                      ),
                      Positioned.fill(
                        child: Image.file(
                          _selectedImage!,
                          fit: BoxFit
                              .cover, // Adjust this to match your requirement
                        ),
                      ),
                    ],
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      setState(() {
        _selectedImage = File(returnedImage.path);
      });
    }
  }
}


//7


