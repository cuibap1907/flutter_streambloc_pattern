import 'package:flutter/cupertino.dart';
import 'package:vanilla_example/src/model/repository.dart';
import 'package:vanilla_example/src/user.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model{
  final RepositoryModel _repositoryModel;

  UserModel(this._repositoryModel);

  bool _isLoading = false;
  User _user;

  User get user => _user;
  bool get isLoading => _isLoading;

  void loadUserData()
  {
    _isLoading = true;
    notifyListeners();
    _repositoryModel.getUser().then((user) {
      _user = user;
      _isLoading = false;
      notifyListeners();
    });
  }

  static UserModel of(BuildContext context) {
    return ScopedModel.of<UserModel>(context);
  }
}