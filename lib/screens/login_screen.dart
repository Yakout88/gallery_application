import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';
import 'gallery_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final AuthService authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  transform: const GradientRotation(-10),
                  colors: [
                    Colors.pink.shade100,
                    Colors.pink.shade100,
                    Colors.purple.shade200,
                    Colors.purple.shade200,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 130.h,
                    ),
                    Text(
                      "    My\nGallery",
                      style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 320.w,
                        height: 400.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.3),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "LOG IN",
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                hintText: "User Name",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintStyle: const TextStyle(color: Colors.grey),
                                hintText: "Password",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            InkWell(
                              onTap: () async {
                                try {
                                  User user = await authService.login(
                                      emailController.text.toString(),
                                      passwordController.text.toString());
                                  debugPrint(user.email);

                                  Navigator.push(
                                      // ignore: use_build_context_synchronously
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => GalleryScreen(
                                                name: user.name,
                                              )));
                                } catch (error) {
                                  debugPrint("+++++++++++++++++++++++ $error");
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: Image.asset(
              "assets/images/LovePhotography.png",
              height: 100.h,
              width: 100.w,
            ),
          ),
        ],
      ),
    );
  }
}
