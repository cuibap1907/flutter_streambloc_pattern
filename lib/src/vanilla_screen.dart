import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:vanilla_example/src/repository.dart';
import 'package:vanilla_example/src/user.dart';

class VanillaScreen extends StatefulWidget {
  final Repository _repository;

  VanillaScreen(this._repository);

  @override
  _VanillaScreenState createState() => _VanillaScreenState();
}

class _VanillaScreenState extends State<VanillaScreen> {
  bool _isLoading = false;
  User _user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Vanilla"),
        ),
        body: SafeArea(
          child: _isLoading?_buildLoading(): _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if(_user != null)
    {
      return _buildContent();
    } else {
      return _buildInit();
    }
  }

  Widget _buildLoading()
  {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent()
  {
    return Center(
      child: Text("Hello ${_user.name} ${_user.surname}"),
    );
  }

  Widget _buildInit() {
    return Center(
      child: RaisedButton(
        child: Text("Load User Data"),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          widget._repository.getUser().then((user) {
            setState(() {
              _user = user;
              _isLoading = false;
            });
          });
        },
      ),
    );
  }
}
