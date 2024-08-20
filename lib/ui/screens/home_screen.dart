import 'package:crm/bloc/user_bloc/user_bloc.dart';
import 'package:crm/services/authentacation_service.dart';
import 'package:crm/ui/screens/profile_screen.dart';
import 'package:crm/ui/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final authService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(authService: authService),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ProfileScreen(),
                  ),
                );
              },
              icon: Icon(
                Icons.person_outlined,
                size: 35.h,
                color: Colors.black,
              ),
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: const Center(
          child: Text('Welcome to Home Screen!'),
        ),
      ),
    );
  }
}
