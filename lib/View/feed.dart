import 'package:flutter/material.dart';
import 'package:rolesapp/Controller/role_controller.dart';

import '../Model/role.dart';
import '../Widget/card_role.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late Future<List<Role>> lista_roles;

  @override
  void initState() {
    super.initState();
    lista_roles = RoleController().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildFutureBuilder());
  }

  buildListView(List<Role>? lista_roles) {
    return ListView.builder(
      itemCount: lista_roles!.length,
      itemBuilder: (BuildContext context, int index) {
        return CardRole(role: lista_roles[index]);
      },
    );
  }

  buildFutureBuilder() {
    return FutureBuilder<List<Role>>(
      future: lista_roles,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildListView(snapshot.data);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
