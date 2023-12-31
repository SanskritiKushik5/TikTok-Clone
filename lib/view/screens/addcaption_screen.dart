import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_app/constants.dart';
import 'package:tiktok_app/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';

class addCaption_Screen extends StatefulWidget {
  File videoFile;
  String videoPath;

  addCaption_Screen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<addCaption_Screen> createState() => _addCaption_ScreenState();
}

class _addCaption_ScreenState extends State<addCaption_Screen> {
  late VideoPlayerController? videoPlayerController;
  TextEditingController songNameController = TextEditingController();
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController!.initialize();
    videoPlayerController!.play();
    videoPlayerController!.setLooping(true);
    videoPlayerController!.setVolume(0.7);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.5,
          child: VideoPlayer(videoPlayerController!),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextInputField(
                controller: songNameController,
                myIcon: Icons.music_note,
                myLabelText: "Song Name"),
            SizedBox(height: 20),
            TextInputField(
                controller: captionController,
                myIcon: Icons.closed_caption,
                myLabelText: "Caption"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text("Upload"),
              style: ElevatedButton.styleFrom(primary: buttonColor),
            )
          ]),
        )
      ]),
    ));
  }
}
