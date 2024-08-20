import 'package:crm/bloc/auth_bloc/auth_bloc.dart';
import 'package:crm/bloc/auth_bloc/auth_event.dart';
import 'package:crm/bloc/auth_bloc/auth_state.dart';
import 'package:crm/ui/screens/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              context.read<AuthenticationBloc>().add(LogoutEvent());
              context.read<AuthenticationBloc>().stream.listen((state) {
                if (state is AuthenticationSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else if (state is AuthenticationFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout failed: ${state.error}')),
                  );
                }
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
