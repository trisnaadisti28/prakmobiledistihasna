import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 0)
class Account extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  String username;

  @HiveField(2)
  String password;

  Account({
    required this.name,
    required this.username,
    required this.password,
  });

}