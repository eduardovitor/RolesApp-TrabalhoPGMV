import 'package:flutter/material.dart';
import 'package:rolesapp/card_role.dart';
import 'package:rolesapp/data/role_dao.dart';

import 'custom_colors.dart';
import 'domain/roles.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  late Future<List<Roles>> lista_roles;

  @override
  void initState() {
    super.initState();
    lista_roles = RoleDao().findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildFutureBuilder());
  }

  buildListView(List<Roles>? lista_roles) {
    return ListView.builder(
      itemCount: lista_roles!.length,
      itemBuilder: (BuildContext context, int index) {
        return CardRole(role: lista_roles[index]);
      },
    );
  }

  buildFutureBuilder() {
    return FutureBuilder<List<Roles>>(
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
