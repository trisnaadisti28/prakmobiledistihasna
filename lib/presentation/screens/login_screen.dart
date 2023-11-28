import 'package:books/presentation/screens/navbar.dart';
import 'package:books/presentation/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:books/core/model/account.dart';
import 'home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final user_controller = TextEditingController();
  final pass_controller = TextEditingController();
  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openHiveBox();
    check_if_already_login();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if(newuser == false){
      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => Navbar()));
    }
  }
  void openHiveBox() async {
    await Hive.openBox<Account>('accounts');
  }

  @override
  void dispose(){
    user_controller.dispose();
    pass_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
             Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/assets/Background.png"),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 150,
                        width: 150,
                        child: SvgPicture.asset("images/assets/buku.svg")),
                    const HeightBox(10),
                    "Login".text.color(Colors.white).size(20).make(),
                    const HeightBox(20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: user_controller,
                        decoration: InputDecoration(
                          hintText: 'Masukkan username anda',
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: 'username',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.blue)),
                          isDense: true,
                          // Added this
                          contentPadding:
                          const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const HeightBox(20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(

                        controller: pass_controller,
                        obscureText:true,
                        decoration: InputDecoration(
                          hintText: 'Masukkan password anda',
                          hintStyle: const TextStyle(color: Colors.white),
                          labelText: 'password',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.blue)),
                          isDense: true,
                          // Added this
                          contentPadding:
                          const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        ),
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    HeightBox(10),
                    GestureDetector(
                        onTap: () async {
                          final String username = user_controller.text;
                          final String password = pass_controller.text;

                          if (Hive.isBoxOpen('accounts')) {
                            final Box<Account> accountBox = Hive.box<Account>('accounts');

                            final existingUser = accountBox.values.firstWhere(
                                  (account) => account.username == username,
                            );

                            if (existingUser.username == username && existingUser.password == password) {
                              print('Successful');
                              logindata.setBool('login', false);
                              logindata.setString('username', username);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => Navbar()),
                              );
                            } else {
                              print('Invalid username or password');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Username atau password salah.'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          } else {
                            print('Hive box is not open');
                          }

                        },
                        child: "Login"
                            .text
                            .white
                            .light
                            .xl
                            .makeCentered()
                            .box
                            .white
                            .shadowOutline(outlineColor: Colors.grey)
                            .color(Color(0XFFFF0772))
                            .roundedLg
                            .make()
                            .w(150)
                            .h(40)),
                    const HeightBox(20),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => registrationpage()));
          },
          child: RichText(
              text: const TextSpan(
                text: 'Buat Akun?',
                style: TextStyle(fontSize: 15.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Register Now',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0XFF4321F5)),
                  ),
                ],
              )).pLTRB(20, 0, 0, 15),
        ));
  }
}

