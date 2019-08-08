import 'package:vanilla_example/src/user.dart';

class Repository {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 3));
    return User(name: "John", surname: "Smith");
  }
}