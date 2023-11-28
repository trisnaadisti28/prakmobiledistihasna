import 'package:books/app/constants/constants.dart';
import 'package:books/presentation/screens/categories.dart';
import 'package:books/presentation/screens/home_screen.dart';
import 'package:books/presentation/screens/profile_page.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // late SharedPreferences logindata;
  late String username;

  @override

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   initial();
  // }
  // void initial() async{
  //   logindata = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = logindata.getString('username')!;
  //   });
  // }

  /*
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    logindata = await SharedPreferences.getInstance();
    bool isLoggedIn = logindata.getBool('login') ?? false;
    if (isLoggedIn) {
      // User is logged in, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // User is not logged in, navigate to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }
  */

  int _currentIndex = 0;
  final screens = const [
    HomeScreen(),
    Categories(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 15),
        unselectedLabelStyle: const TextStyle(fontSize: 13),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
