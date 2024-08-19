import 'package:crm/ui/screens/auth/screens/step/sign_up_step2.dart';
import 'package:crm/ui/screens/auth/screens/step/sign_up_step4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyInfoScreen extends StatefulWidget {
  @override
  _CompanyInfoScreenState createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends State<CompanyInfoScreen> {
  String companyName = '';
  String businessDirection = 'IT and programming';
  String teamSize = '21 - 40';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/woorkroom.svg'),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20.r),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Text('STEP 3/4', style: TextStyle(color: Colors.blue)),
                  Text('Tell about your company',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.h),
                  Text('Your Company\'s Name'),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Company\'s Name',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15.r), // To'g'ri o'lcham
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        companyName = value;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text('Business Direction'),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400, width: 2),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: DropdownButton<String>(
                      value: businessDirection,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          businessDirection = newValue!;
                        });
                      },
                      items: <String>[
                        'IT and programming',
                        'Finance',
                        'Healthcare',
                        'Education',
                        'Retail'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text('How many people in your team?'),
                  Wrap(
                    spacing: 10.w, // Spacing for horizontal space
                    runSpacing: 10.h, // Spacing for vertical space
                    children: [
                      'Only me',
                      '2 - 5',
                      '6 - 10',
                      '11 - 20',
                      '21 - 40',
                      '41 - 50',
                      '51 - 100',
                      '101 - 500'
                    ]
                        .map((size) => ChoiceChip(
                              label: Text(size),
                              selected: teamSize == size,
                              onSelected: (bool selected) {
                                setState(() {
                                  teamSize = size;
                                });
                              },
                              backgroundColor: Colors.grey[200],
                              selectedColor: Colors.blue,
                              labelStyle: TextStyle(
                                  color: teamSize == size
                                      ? Colors.white
                                      : Colors.black),
                            ))
                        .toList(),
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
                            builder: (ctx) => TellAboutYourselfScreen()));
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
                            builder: (ctx) => InviteTeamMembersScreen()));
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
