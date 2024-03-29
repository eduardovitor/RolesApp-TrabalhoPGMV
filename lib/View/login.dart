import 'package:flutter/material.dart';
import 'package:rolesapp/Controller/usuario_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Colors/custom_colors_singleton.dart';
import '../Preferences/shared_preferences_helper.dart';
import '../Widget/myforminput.dart';
import 'cadastro.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildBody(), backgroundColor: CustomColorsSing().gray);
  }

  buildBody() {
    return Form(
        key: _formkey,
        child: ListView(padding: const EdgeInsets.all(16), children: <Widget>[
          const SizedBox(height: 130),
          MyFormInput(
            label: 'Email',
            hint: 'Digite o email',
            validator: checkFieldEmpty,
            controller: controllerEmail,
          ),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Senha',
            hint: 'Digite a senha',
            validator: checkFieldEmpty,
            isTextObscured: true,
            controller: controllerSenha,
          ),
          const SizedBox(height: 25),
          buildRowOpcoes(),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
                primary: CustomColorsSing().purple,
                onPrimary: Colors
                    .white, // shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)
              ),
              onPressed: onPressed,
              child: const Text("Entrar")),
          TextButton(
              style: TextButton.styleFrom(
                primary: CustomColorsSing().black,
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

  void onPressed() async {
    bool isValid = _formkey.currentState!.validate();
    bool user_exists = await UsuarioController()
        .login(controllerEmail.text, controllerSenha.text);
    if (isValid && user_exists) {
      SharedPreferencesHelper sharedPref = SharedPreferencesHelper();
      sharedPref.setUserData(true);
      pushHomePage();
    }
  }

  void pushHomePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
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
      return CustomColorsSing().purple;
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
