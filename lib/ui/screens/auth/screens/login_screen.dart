import 'package:crm/services/authentacation_service.dart';
import 'package:crm/ui/screens/auth/screens/register_screen.dart';
import 'package:crm/ui/screens/auth/screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:crm/ui/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthenticationService _authService = AuthenticationService();
  bool _obscureTexts = true;

  Future<void> handleLogin() async {
    final phone = phonenumberController.text;
    final password = passwordController.text;

    try {
      final response = await _authService.loginUser(phone, password);

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed. Please try again.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),
            SvgPicture.asset('assets/svg/woorkroom.svg', height: 45.h),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Container(
                padding: EdgeInsets.all(20.r),
                height: 550.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In to Woorkroom',
                          style: TextStyle(
                            fontSize: 20.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: phonenumberController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                        hintText: 'phone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureTexts
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureTexts = !_obscureTexts;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureTexts,
                      obscuringCharacter: '●',
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_box_outline_blank,
                                size: 26.h,
                              ),
                            ),
                            Text(
                              'Remember me',
                              style: TextStyle(fontSize: 17.h),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => ResetPasswordScreen()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade500,
                              fontSize: 14.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        handleLogin();
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
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
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18.h,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 25.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => RegisterScreen()),
                            );
                          },
                          child: Text(
                            'Don’t have an account?',
                            style: TextStyle(
                              fontSize: 16.h,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
