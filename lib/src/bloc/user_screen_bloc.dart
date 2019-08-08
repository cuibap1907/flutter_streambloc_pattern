import 'package:flutter/material.dart';
import 'package:vanilla_example/src/bloc/user_bloc.dart';
import 'package:vanilla_example/src/repository.dart';
import 'package:vanilla_example/src/user.dart' as prefix0;
import 'package:vanilla_example/src/user.dart';

class UserBlocScreen extends StatefulWidget {
  final Repository _repository;

  UserBlocScreen(this._repository);

  @override
  _UserBlocScreenState createState() => _UserBlocScreenState();
}

class _UserBlocScreenState extends State<UserBlocScreen> {
  UserBloc _userBloc;

  @override
  void initState() {
    _userBloc = UserBloc(widget._repository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bloc Example load user"),
        ),
        body: SafeArea(
          child: StreamBuilder<UserState>(
            stream: _userBloc.user,
            initialData: UserInitState(),
            builder: (context, snapshot) {
              if(snapshot.data is UserInitState)
              {
                return _buildInit();
              }

              if(snapshot.data is UserDataState)
              {
                UserDataState state = snapshot.data;
                return _buildContent(state.user);
              }

              if(snapshot.data is UserLoadingState)
              {
                return _buildLoading();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading()
  {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildContent(User user) {
    return Center(
      child: Text("Hello ${user.name} ${user.surname}"),
    );
  }

  Widget _buildInit()
  {
    return Center(
      child: RaisedButton(
        child: Text("Load user data"),
        onPressed: () {
          _userBloc.loadUserData();
        },
      ),
    );
  }

  void dispose()
  {
    _userBloc.dispose();
    super.dispose();
  }
}