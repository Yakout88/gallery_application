import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k/services/image_upload_service.dart';
import 'package:k/widgets/choose_camera.dart';
import 'package:k/widgets/choose_gallery.dart';
import 'package:k/widgets/circle_of_user.dart';
import 'package:k/widgets/logout.dart';
import 'package:k/widgets/name_of_user.dart';
import 'package:k/widgets/upload.dart';

import '../services/gallery_service.dart';
import '../widgets/part_of_pics.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key, required this.name});
  final String name;

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final GalleryService galleryService = GalleryService();

  File? _imageFile;
  Future<dynamic> showDialogForGalleryAndCameraForUploadPic(
      BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(50),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: const ChooseGallery(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  child: const ChooseCamera(),
                ),
              ],
            ),
            backgroundColor: Colors.white.withOpacity(.5),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
    } else {
      const ScaffoldMessenger(
          child: SnackBar(content: Text('No image selected.')));
    }
    setState(() {});
  }

  Future<void> uploadImage() async {
    if (_imageFile == null) {
      return;
    }

    final response = await ImageUploadService.uploadImage(_imageFile!);
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.purple[100],
        content: Text(response.message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.purple[100],
              image: const DecorationImage(
                image: AssetImage("assets/images/Vector.png"),
                fit: BoxFit.fill,
                opacity: .5,
                alignment: Alignment.topRight,
                centerSlice: Rect.zero,
              ),
            ),
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  await uploadImage();
                  setState(() {});
                },
                child: const Text("Accept"),
              ),
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    NameOfUser(widget: widget),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Logout(),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialogForGalleryAndCameraForUploadPic(context);
                          },
                          child: const Upload(),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PartOfPics(galleryService: galleryService)
                  ],
                ),
              ),
            ),
          ),
          const CircleOfUser(),
        ],
      ),
    );
  }
}
