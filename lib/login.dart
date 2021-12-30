import 'package:rolesapp/cadastro.dart';
import 'package:rolesapp/custom_colors.dart';
import 'package:rolesapp/myforminput.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyForm(), backgroundColor: CustomColors.gray);
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
        child: ListView(padding: const EdgeInsets.all(16), children: <Widget>[
          const SizedBox(height: 130),
          const MyFormInput(
              label: 'Email',
              hint: 'Digite o email',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Senha',
              hint: 'Digite a senha',
              validator: checkFieldEmpty,
              isTextObscured: true),
          const SizedBox(height: 25),
          buildRowOpcoes(),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
                primary: CustomColors.purple,
                onPrimary: Colors
                    .white, // shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)
              ),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
              },
              child: const Text("Entrar")),
          TextButton(
              style: TextButton.styleFrom(
                primary: CustomColors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cadastro()),
                );
              },
              child: const Text('Não tem conta? Cadastre-se'))
        ]));
  }
}

buildRowOpcoes() {
  return Row(
    children: [
      CheckButtonWidget(),
      Text('Permanecer logado ?', style: TextStyle(fontSize: 11)),
      SizedBox(width: 35),
      Text('Esqueceu a senha ?', style: TextStyle(fontSize: 11))
    ],
  );
}

class CheckButtonWidget extends StatefulWidget {
  const CheckButtonWidget({Key? key}) : super(key: key);

  @override
  _CheckButtonWidgetState createState() => _CheckButtonWidgetState();
}

class _CheckButtonWidgetState extends State<CheckButtonWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      return CustomColors.purple;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
