import 'package:rolesapp/custom_colors.dart';
import 'package:flutter/material.dart';

class CreateRole extends StatefulWidget {
  const CreateRole ({ Key? key }) : super(key: key);

  @override
  _CreateRoleState createState() => _CreateRoleState();
}

class _CreateRoleState extends State<CreateRole> {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.gray,
        centerTitle: true,
        title: Text('Rolês'),
        titleTextStyle:  TextStyle(
          color: CustomColors.DimGray,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        actions: [
          IconButton(icon: Icon(Icons.add_circle_outline_sharp, color: Colors.deepPurple, size: 30), onPressed: (){}),
          IconButton(icon: Icon(Icons.search_outlined, color: Colors.deepPurple, size: 35), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert, color: Colors.deepPurple, size: 35), onPressed: (){}),
        ],
      ),
      body: buildBody(),
    );
    return scaffold;
  }

  Container buildBody(){
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      color: CustomColors.gray,
      height: 380,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildConteudoRole(),
          ]
        )
   );
  }

  Column buildConteudoRole(){
    return Column(
      children:  [
          Text(
        '"Nome do Rolê"',
        style: TextStyle(
          color: CustomColors.DimGray,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '"Nome do Criador do rolê"',
        style: TextStyle(
          color: CustomColors.DimGray,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8n0Q2yzP5OoN2jDurG2H5Kbxggvopqc3Fpw&usqp=CAU'),
       Text(
        '"Data e Horario"',
        style: TextStyle(
          color: CustomColors.DimGray,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
       Text(
        '"Local"',
        style: TextStyle(
          color: CustomColors.DimGray,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
       Text(
        '"N° Visualizações e N° Confirmações"',
        style: TextStyle(
          color: CustomColors.DimGray,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.deepPurple,
        ),        
        child: const Text(
          'Partiu Rolê',
          style: 
          TextStyle(
          backgroundColor: Colors.deepPurple,
          color: CustomColors.gray,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        ),
         onPressed: (){},
        )
    ],    
    );
  }
}