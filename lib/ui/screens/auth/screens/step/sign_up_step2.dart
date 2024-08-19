import 'package:crm/ui/screens/auth/screens/step/sign_up_step1.dart';
import 'package:crm/ui/screens/auth/screens/step/sign_up_step3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TellAboutYourselfScreen extends StatefulWidget {
  @override
  _TellAboutYourselfScreenState createState() =>
      _TellAboutYourselfScreenState();
}

class _TellAboutYourselfScreenState extends State<TellAboutYourselfScreen> {
  String selectedService = 'Work';
  String selectedDescription = 'Business Owner';
  bool yesSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.h),
          Center(
            child: SvgPicture.asset(
              'assets/svg/woorkroom.svg',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  Text(
                    'STEP 2/4',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.h,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Tell about yourself',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.h,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Why will you use the service?',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15.r),
                    width: double.infinity,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.grey.shade400, width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedService,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedService = newValue!;
                          });
                        },
                        items: <String>['Work', 'Study', 'Personal']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 15.h,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          );
                        }).toList(),
                        style: TextStyle(
                            fontSize: 16.h, color: Colors.grey.shade500),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey.shade500,
                          size: 25.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'What describes you best?',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15.r),
                    width: double.infinity,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: Colors.grey.shade400, width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedDescription,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDescription = newValue!;
                          });
                        },
                        items: <String>[
                          'Business Owner',
                          'Employee',
                          'Freelancer'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 15.h,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          );
                        }).toList(),
                        style: TextStyle(
                            fontSize: 16.sp, color: Colors.grey.shade500),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey.shade500,
                          size: 25.h,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'What describes you best?',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.4,
                              child: Radio<bool>(
                                value: true,
                                groupValue: yesSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    yesSelected = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.h,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Transform.scale(
                              scale: 1.4,
                              child: Radio<bool>(
                                value: false,
                                groupValue: yesSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    yesSelected = value!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              'No',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.h,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => PhoneValidationScreen()));
                  },
                  label: Text(
                    'Previous',
                    style: TextStyle(
                      fontSize: 18.h,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                    size: 22.h,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => CompanyInfoScreen()));
                  },
                  child: Container(
                    height: 65.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next Step',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
