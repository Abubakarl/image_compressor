// ignore_for_file: file_names, must_be_immutable

import 'dart:io';
import 'package:flutter/material.dart';
class ImageFrame extends StatelessWidget {
  File? imageFile;
  double width;
  double height;
  ImageFrame({
    super.key,
    required this.imageFile,
    this.width = 200,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: imageFile != null
            ? Image.file(
                imageFile!,
                fit:BoxFit.contain,
                frameBuilder: (
                  context,
                  child,
                  frame,
                  wasSynchronouslyLoaded,
                ) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: child,
                  );
                },
                excludeFromSemantics: true,
                height: height,
                width: width,
              )
            : Container()
      ),
    );
  }
}
