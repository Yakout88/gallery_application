import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseGallery extends StatelessWidget {
  const ChooseGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/gallery.png",
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            "Gallery",
            style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
