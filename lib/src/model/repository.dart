import 'package:vanilla_example/src/model/user_model.dart';
import 'package:vanilla_example/src/user.dart';

class RepositoryModel {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 3));
    return User(name: "Jame", surname: "Smith");
  }
}