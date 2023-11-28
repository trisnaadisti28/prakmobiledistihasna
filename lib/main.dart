import 'package:books/app/notifiers/app_notifier.dart';
import 'package:books/presentation/screens/login_screen.dart';
import 'package:books/presentation/screens/navbar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/constants/constants.dart';
import 'core/model/account.dart';

String boxName = 'ACCOUNTBOX';
void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter<Account>(AccountAdapter());
  await Hive.openBox<Account>(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: textTheme),
        home: LoginPage(),
      ),
    );
  }
}
