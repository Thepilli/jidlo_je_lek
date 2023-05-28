import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Thumbnailer(),
    );
  }
}

class Thumbnailer extends StatefulWidget {
  const Thumbnailer({Key? key}) : super(key: key);

  @override
  State<Thumbnailer> createState() => _ThumbnailerState();
}

class _ThumbnailerState extends State<Thumbnailer> {
  String? _thumbnailFile;

  Uint8List? _thumbnailData;

  @override
  void initState() {
    super.initState();
    generateThumbnail();
  }

  Future<File> copyAssetFile(String assetFileName) async {
    Directory tempDir = await getTemporaryDirectory();
    final byteData = await rootBundle.load(assetFileName);

    File videoThumbnailFile = File("${tempDir.path}/$assetFileName")
      ..createSync(recursive: true)
      ..writeAsBytesSync(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return videoThumbnailFile;
  }

  void generateThumbnail() async {
    File videoTempFile1 =
        await copyAssetFile("assets/video/pusheen_how_to_contact_aliens.mp4");
    File videoTempFile2 =
        await copyAssetFile("assets/video/pusheen_how_to_contact_aliens.mp4");

    _thumbnailFile = await VideoThumbnail.thumbnailFile(
        video: videoTempFile1.path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG);

    _thumbnailData = await VideoThumbnail.thumbnailData(
      video: videoTempFile2.path,
      imageFormat: ImageFormat.JPEG,
      // maxHeight: 300,
      // maxWidth: 300,
      quality: 75,
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Video Thumbnail"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                if (_thumbnailFile != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Thumbnail using thumbnail file path :"),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.file(File(_thumbnailFile!)),
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black45,
                            child: Icon(
                              Icons.play_arrow,
                              size: 40,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (_thumbnailData != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Thumbnail using in memory thumbnail :"),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.memory(_thumbnailData!),
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black45,
                            child: Icon(
                              Icons.play_arrow,
                              size: 40,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
