
import 'custom_colors.dart';
import 'package:flutter/material.dart';

import 'myforminput.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyForm());
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: ListView(padding: EdgeInsets.all(16), children: <Widget>[
          const SizedBox(height: 30),
          const MyFormInput(
              label: 'Nome', hint: 'Digite o nome', validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Apelido',
              hint: 'Digite o apelido',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Data de nascimento',
              hint: 'Digite sua data de nascimento',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Email',
              hint: 'Digite seu email',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Senha',
              hint: 'Digite a senha',
              validator: checkFieldEmpty,
              isTextObscured: true),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Bebe?', validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Fuma?',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  primary: CustomColors.red,
                  onPrimary: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  )),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('')),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Home()),
                  // );
                }
              },
              child: Text("Cadastrar")),
        ]));
  }
}