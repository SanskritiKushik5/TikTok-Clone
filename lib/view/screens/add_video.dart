import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_app/constants.dart';
import 'package:tiktok_app/view/screens/addcaption_screen.dart';

class addVideoScreen extends StatelessWidget {
  const addVideoScreen({super.key});

  videoPick(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
      // Get.off(addCaption_Screen(
      //     videoFile: File(video.path), videoPath: video.path));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => addCaption_Screen(
                    videoFile: File(video.path),
                    videoPath: video.path,
                  )));
    } else {
      Get.snackbar(
          "Error in Selecting Video", "Please choose a different video file!");
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => (SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    videoPick(ImageSource.gallery, context);
                  },
                  child: Text('Gallery'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    videoPick(ImageSource.camera, context);
                  },
                  child: Text('Camera'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close'),
                ),
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
              width: 190,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
              ),
              child: Center(
                child: Text(
                  'Add Video',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))),
    ));
  }
}
