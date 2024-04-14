import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseCamera extends StatelessWidget {
  const ChooseCamera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius:
            BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/camera.png",
            scale: 1.5,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            "Camera",
            style: TextStyle(
                fontSize: 26.sp,
                fontWeight:
                    FontWeight.bold),
          )
        ],
      ),
    );
  }
}

