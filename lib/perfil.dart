import 'package:flutter/material.dart';

import 'custom_colors.dart';
import 'myforminput.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody());
  }
}

buildBody() {
  return Column(
    children: [buildPlaceHolder(), MyForm()],
  );
}

buildPlaceHolder() {
  return const Padding(
      padding: EdgeInsets.all(16),
      child: Placeholder(
        fallbackWidth: 150,
        fallbackHeight: 150,
      ));
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
        child: Expanded(
            child:
                ListView(padding: const EdgeInsets.all(16), children: <Widget>[
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
          const MyFormInput(label: 'Bebe?', validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(label: 'Fuma?', validator: checkFieldEmpty),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
                primary: CustomColors.purple,
                onPrimary: Colors.white,
                //   shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              ),
              onPressed: () {
                if (_formkey.currentState!.validate()) {}
              },
              child: const Text("Salvar alterações")),
        ])));
  }
}
