import 'package:crm/ui/screens/auth/screens/login_screen.dart';
// import 'package:crm/ui/screens/auth/screens/step/sign_up_step1.dart';
// import 'package:crm/ui/screens/auth/screens/step/sign_up_step2.dart';
// import 'package:crm/ui/screens/auth/screens/step/sign_up_step3.dart';
// import 'package:crm/ui/screens/auth/screens/step/sign_up_step4.dart';
// import 'package:crm/ui/screens/auth/screens/step/sign_up_succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: SignUpSuccesScreen(),
          // home: InviteTeamMembersScreen(),
          // home: CompanyInfoScreen(),
          // home: TellAboutYourselfScreen(),
          // home: PhoneValidationScreen(),
          home: LoginScreen(),
        );
      },
    );
  }
}
