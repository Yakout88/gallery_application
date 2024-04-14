import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k/screens/gallery_screen.dart';

class NameOfUser extends StatelessWidget {
  const NameOfUser({
    super.key,
    required this.widget,
  });

  final GalleryScreen widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Welcome\n${widget.name}",
          style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
