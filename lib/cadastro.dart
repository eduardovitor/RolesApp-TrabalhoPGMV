import 'custom_colors.dart';
import 'package:flutter/material.dart';

import 'data/usuario_dao.dart';
import 'domain/usuarios.dart';
import 'home.dart';
import 'myforminput.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();
  TextEditingController controllerUrl = TextEditingController();
  TextEditingController controllerApelido = TextEditingController();
  TextEditingController controllerDataNasc = TextEditingController();
  TextEditingController controllerBebe = TextEditingController();
  TextEditingController controllerFuma = TextEditingController();
  TextEditingController controllerIdade = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBody());
  }

  buildBody() {
    return Form(
        key: _formkey,
        child: ListView(padding: EdgeInsets.all(16), children: <Widget>[
          const SizedBox(height: 30),
          MyFormInput(
              label: 'Nome',
              hint: 'Digite o nome',
              validator: checkFieldEmpty,
              controller: controllerNome),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Apelido',
              hint: 'Digite o apelido',
              validator: checkFieldEmpty,
              controller: controllerApelido),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Data de nascimento',
            hint: 'Digite sua data de nascimento',
            validator: checkFieldEmpty,
            controller: controllerDataNasc,
          ),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Idade',
            hint: 'Digite sua idade',
            validator: checkFieldEmpty,
            controller: controllerIdade,
          ),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Email',
            hint: 'Digite seu email',
            validator: checkFieldEmpty,
            controller: controllerEmail,
          ),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Senha',
              hint: 'Digite a senha',
              validator: checkFieldEmpty,
              isTextObscured: true,
              controller: controllerSenha),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Imagem',
              hint: 'Digite o endereço da sua imagem na internet',
              validator: checkFieldEmpty,
              controller: controllerUrl),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Bebe?',
              hint: 'Digite sim (bebo) ou não (não bebo)',
              validator: checkFieldEmpty,
              controller: controllerBebe),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Fuma?',
            hint: 'Digite sim (fumo) ou não (não fumo)',
            validator: checkFieldEmpty,
            controller: controllerFuma,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 40),
                primary: CustomColors.purple,
                onPrimary: Colors.white,
                //  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              ),
              onPressed: onPressed,
              child: Text("Cadastrar")),
        ]));
  }

  void onPressed() async {
    Usuarios usuario = Usuarios(
        apelido: controllerApelido.text,
        bebe: controllerBebe.text,
        datanasc: controllerDataNasc.text,
        email: controllerEmail.text,
        fuma: controllerFuma.text,
        idade: int.parse(controllerIdade.text),
        nome: controllerNome.text,
        senha: controllerSenha.text,
        url_imagem: controllerUrl.text);
    bool isValid = _formkey.currentState!.validate();
    bool user_cadastrado = await UsuarioDao().cadastrarUsuario(usuario);
    if (isValid && user_cadastrado) {
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
