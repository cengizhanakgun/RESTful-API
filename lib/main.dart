import 'package:flutter/material.dart';
import 'package:restfull/service/user_service.dart';

import 'model/user_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  UserService _service = UserService();

  List<UsersModelData?>users = [];

  @override
  void initState() {
    super.initState();
    _service.fetchUsers().then((value){

    if(value != null&&value.data!= null){
      setState(() {
        users.value.data!;
      });
    }

    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),

        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text("${users[index].firstName!+users[index].lastName!}"),
              subtitle: Text(users[index].email!),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index].avatar!),
              ),
            )
          },
        ),

      ),
    );
  }
}
