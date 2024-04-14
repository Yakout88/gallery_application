import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logout extends StatelessWidget {
  const Logout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45.h,
      width: 145.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset("assets/images/red_con.png"),
              Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                left: 0,
                child:
                    Image.asset("assets/images/left.png"),
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            "log out",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
