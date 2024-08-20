import 'package:crm/bloc/auth_bloc/auth_bloc.dart';
import 'package:crm/bloc/user_bloc/user_bloc.dart';
import 'package:crm/services/authentacation_service.dart';
import 'package:crm/ui/screens/auth/screens/login_screen.dart';
import 'package:crm/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AuthenticationService authService = AuthenticationService();

  bool authenticated = await authService.isAuthenticated();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(authService: authService),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(authService),
        ),
      ],
      child: MyApp(
        authService: authService,
        isAuthenticated: authenticated,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthenticationService authService;
  final bool isAuthenticated;

  MyApp({super.key, required this.authService, required this.isAuthenticated});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isAuthenticated ? HomeScreen() : LoginScreen(),
        );
      },
    );
  }
}
