import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../components/imageFrame.dart';
import '../functions/compress.dart';
import '../functions/imagepick.dart';

File? file;
// void getpermission() async {
//   final storagePermission = await Permission.storage.request();
//   if (storagePermission.isGranted) {
//     print("Granted");
//   } else {
//     print("Denied");
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image compressor",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageFrame(
            imageFile: file,
            width: width * .95,
            height: height * .7,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              onPressed: () async {
                final imagePath = await PickImage(
                  ImageSource.gallery,
                );
                file = File(imagePath!.path);
                final newimage = await Compress(
                  File(
                    imagePath.path,
                  ),
                );
                file = newimage;
                setState(
                  () {},
                );
              },
              icon: const Icon(
                Icons.add_a_photo_outlined,
              ),
              label: const Text(
                "Add Image",
              ),
            ),
          )
        ],
      ),
    );
  }
}
