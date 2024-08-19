import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpSuccesScreen extends StatefulWidget {
  const SignUpSuccesScreen({super.key});

  @override 
  State<SignUpSuccesScreen> createState() => _SignUpSuccesScreenState();
}

class _SignUpSuccesScreenState extends State<SignUpSuccesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
        children: [
          SizedBox(height: 100.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/woorkroom.svg'),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  SvgPicture.asset('assets/svg/sign_up_succes.svg'),
                  SizedBox(height: 20.h),
                  Text(
                    'You are successfully registered!',
                    style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    height: 50.h,
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10.0,
                          blurStyle: BlurStyle.normal,
                          color: Colors.blue.withOpacity(0.5),
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Let's Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.h,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 22.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
