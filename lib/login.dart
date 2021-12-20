import 'package:rolesapp/myforminput.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          const SizedBox(height: 150),
          const MyFormInput(
              label: 'Email',
              hint: 'Digite o email',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Senha',
              hint: 'Digite a senha',
              validator: checkFieldEmpty),
          const SizedBox(height: 25),
          buildRowOpcoes(),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(150, 40),
                  primary: Color(0xFF61b98e),
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
              child: Text("Entrar")),
        ]));
  }
}

buildRowOpcoes() {
  return Row(
    children: [
      CheckButtonWidget(),
      Text('Permanecer logado ?', style: TextStyle(fontSize: 11)),
      const SizedBox(width: 35),
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
      return const Color(0xFF61b98e);
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