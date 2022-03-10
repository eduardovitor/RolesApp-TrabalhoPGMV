import 'package:rolesapp/textcontroller_cad_facade.dart';

import 'custom_colors_singleton.dart';
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
  TextControllerCadFacade textControllers = TextControllerCadFacade();
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
              controller: textControllers.controllerNome),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Apelido',
              hint: 'Digite o apelido',
              validator: checkFieldEmpty,
              controller: textControllers.controllerApelido),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Data de nascimento',
            hint: 'Digite sua data de nascimento',
            validator: checkFieldEmpty,
            controller: textControllers.controllerDataNasc,
          ),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Idade',
            hint: 'Digite sua idade',
            validator: checkFieldEmpty,
            controller: textControllers.controllerIdade,
          ),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Email',
            hint: 'Digite seu email',
            validator: checkFieldEmpty,
            controller: textControllers.controllerEmail,
          ),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Senha',
              hint: 'Digite a senha',
              validator: checkFieldEmpty,
              isTextObscured: true,
              controller: textControllers.controllerSenha),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Imagem',
              hint: 'Digite o endereço da sua imagem na internet',
              validator: checkFieldEmpty,
              controller: textControllers.controllerUrl),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Bebe?',
              hint: 'Digite sim (bebo) ou não (não bebo)',
              validator: checkFieldEmpty,
              controller: textControllers.controllerBebe),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Fuma?',
            hint: 'Digite sim (fumo) ou não (não fumo)',
            validator: checkFieldEmpty,
            controller: textControllers.controllerFuma,
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 40),
                primary: CustomColorsSing().purple,
                onPrimary: Colors.white,
                //  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              ),
              onPressed: onPressed,
              child: Text("Cadastrar")),
        ]));
  }

  void onPressed() async {
    Usuarios usuario = Usuarios(
        apelido: textControllers.controllerApelido.text,
        bebe: textControllers.controllerBebe.text,
        datanasc: textControllers.controllerDataNasc.text,
        email: textControllers.controllerEmail.text,
        fuma: textControllers.controllerFuma.text,
        idade: int.parse(textControllers.controllerIdade.text),
        nome: textControllers.controllerNome.text,
        senha: textControllers.controllerSenha.text,
        url_imagem: textControllers.controllerUrl.text);
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
