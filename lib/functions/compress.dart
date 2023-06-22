import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

Future<File> Compress(
  File initFile,
) async {
  String temp = "";
  await getTemporaryDirectory().then(
    (value) => {
      temp =
          "${value.path}/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg",
    },
  );
  final status = await FlutterImageCompress.compressAndGetFile(
    initFile.absolute.path,
    temp,
    keepExif: false,
    quality: 20,
  );
  GallerySaver.saveImage(
    status!.path,
    albumName: "Compressed Images",
  );
  return File(status.path);
}
