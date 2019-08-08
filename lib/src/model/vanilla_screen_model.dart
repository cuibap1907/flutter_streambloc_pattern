import 'package:flutter/material.dart';
import 'package:vanilla_example/src/model/repository.dart';
import 'package:vanilla_example/src/model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class UserModelScreen extends StatefulWidget {
  final RepositoryModel _repositoryModel;

  UserModelScreen(this._repositoryModel);
  @override
  _UserModelScreenState createState() => _UserModelScreenState();
}

class _UserModelScreenState extends State<UserModelScreen> {
  UserModel _userModel;

  @override
  void initState() {
    _userModel = UserModel(widget._repositoryModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScopedModel(
        model: _userModel,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Scoped Model"),
          ),
          body: SafeArea(
            child: ScopedModelDescendant<UserModel>(
              builder: (context, child, model) {
                if(model.isLoading)
                {
                  return _buildLoading();
                } else {
                  if(model.user != null)
                  {
                    return _buildContent(model);
                  } else {
                    return _buildInit(model);
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(UserModel userModel) {
    return Center(
      child: Text("Hello ${userModel.user.name} ${userModel.user.surname}"),
    );
  }

  Widget _buildInit(UserModel userModel) {
    return Center(
      child: RaisedButton(
        child: Text("Load User Data."),
        onPressed: () {
          userModel.loadUserData();
        },
      ),
    );
  }
}
