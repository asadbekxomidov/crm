import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InviteTeamMembersScreen extends StatefulWidget {
  @override
  _InviteTeamMembersScreenState createState() =>
      _InviteTeamMembersScreenState();
}

class _InviteTeamMembersScreenState extends State<InviteTeamMembersScreen> {
  List<String> memberEmails = [''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/woorkroom.svg'),
                ],
              ),
              SizedBox(height: 20),
              Text('STEP 4/4', style: TextStyle(color: Colors.blue)),
              Text('Invite Team Members',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: memberEmails.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Member\'s Email'),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'memberemail@gmail.com',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            memberEmails[index] = value;
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.add, color: Colors.blue),
                label: Text('Add another Member',
                    style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  setState(() {
                    memberEmails.add('');
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle previous step
                    },
                    child:
                        Text('Previous', style: TextStyle(color: Colors.blue)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle next step
                    },
                    child: Text('Next Step'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
