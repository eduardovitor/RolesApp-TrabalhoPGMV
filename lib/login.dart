import 'package:rolesapp/cadastro.dart';
import 'package:rolesapp/custom_colors.dart';
import 'package:rolesapp/data/usuario_dao.dart';
import 'package:rolesapp/myforminput.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  late SharedPreferences loginData;
  late SharedPreferences newUser;

  @override
  void initState() {
    super.initState();
    hasLogged();
  }

  void hasLogged() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool('login') ?? true) as SharedPreferences;
    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody(), backgroundColor: CustomColors.gray);
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
                primary: CustomColors.purple,
                onPrimary: Colors
                    .white, // shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),)
              ),
              onPressed: onPressed,
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

  void onPressed() async {
    bool isValid = _formkey.currentState!.validate();
    bool user_exists =
        await UsuarioDao().login(controllerEmail.text, controllerSenha.text);
    if (isValid && user_exists) {
      loginData.setBool('login', false);
      loginData.setString('email', controllerEmail.text);
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
