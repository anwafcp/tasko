import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/application/authatication/model/user_model.dart';
import 'package:task_app/application/taks/controller/profile_controller.dart';

class UsersProfile extends StatefulWidget {
  const UsersProfile({super.key});

  @override
  State<UsersProfile> createState() => _UsersProfileState();
}

class _UsersProfileState extends State<UsersProfile> {

  @override
  Widget build(BuildContext context) {
    final profileHome = Provider.of<ProfileController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
      ),
      body: StreamBuilder<UserModel>(
          stream: profileHome.userGetData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return  Center(
                child: Text("No data...."),
              );
            }
            final data = snapshot.data;
            return Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: Center(
                        child: Text(data!.firstName[1]),
                      ),
                    ),
                    const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          child: Icon(Icons.edit),
                        ))
                  ],
                )
              ],
            );
          }
          ),
    );
  }
}
