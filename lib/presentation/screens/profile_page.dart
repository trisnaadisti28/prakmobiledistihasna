
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/model/user.dart';
import '../../utils/user_preferences.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/profile_widget.dart';
import 'edit_profile_page.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences logindata;
  late String username;
  late String name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    username = logindata.getString('username')?? '';
  }

  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Builder(
        builder: (context) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              logindata.setBool('login', true);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginPage()));
            },
            child: Icon(Icons.logout, color: Colors.white),
            backgroundColor: Colors.red,
            splashColor: Colors.redAccent,
          ),
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              // const SizedBox(height: 24),
              const SizedBox(height: 24),
              //NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      );
  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tentang projek',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(fontSize: 16, height: 1.4),
        ),
      ],
    ),
  );

//Widget buildUpgradeButton() => ButtonWidget(
//    onClicked: () {},
// );
}
