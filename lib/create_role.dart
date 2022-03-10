import 'package:rolesapp/custom_colors_singleton.dart';
import 'package:flutter/material.dart';
import 'package:rolesapp/data/role_dao.dart';
import 'package:rolesapp/domain/roles.dart';
import 'package:rolesapp/textcontroller_role_facade.dart';

import 'myforminput.dart';

class CreateRole extends StatefulWidget {
  const CreateRole({Key? key}) : super(key: key);

  @override
  _CreateRoleState createState() => _CreateRoleState();
}

class _CreateRoleState extends State<CreateRole> {
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
  TextControllerRoleFacade textControllers = TextControllerRoleFacade();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: ListView(padding: const EdgeInsets.all(16), children: <Widget>[
          const SizedBox(height: 30),
          MyFormInput(
            label: 'Nome',
            hint: 'Digite o nome',
            validator: checkFieldEmpty,
            controller: textControllers.controllerNome,
          ),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Local curto',
            hint: 'Digite o local de forma curta',
            validator: checkFieldEmpty,
            controller: textControllers.controllerLocalcurto,
          ),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Descrição',
              hint: 'Digite a descrição',
              validator: checkFieldEmpty,
              controller: textControllers.controllerDescricao),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Data',
              hint: 'Digite a data',
              validator: checkFieldEmpty,
              controller: textControllers.controllerData),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Horário',
              hint: 'Digite o horário',
              validator: checkFieldEmpty,
              controller: textControllers.controllerHorario),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Custos',
              hint: 'Digite qual o custo do rolê',
              validator: checkFieldEmpty,
              controller: textControllers.controllerCustos),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Observações (opcional)',
              hint: 'Digite alguma observação relevante',
              controller: textControllers.controllerObservacoes),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'CEP',
              hint: 'Digite o CEP do local sem espaços ou hifens',
              validator: checkFieldEmpty,
              controller: textControllers.controllerCEP),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Imagem do local',
              hint:
                  'Copie uma url de uma imagem da internet que represente o local',
              controller: textControllers.controllerImagem),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Idade mínima',
              hint: 'Digite a idade mínima',
              validator: checkFieldEmpty,
              controller: textControllers.controllerIdadeMin),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
                primary: CustomColorsSing().purple,
                onPrimary: Colors.white,
                //  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              ),
              onPressed: onPressed,
              child: const Text("Criar rolê")),
        ]));
  }

  void onPressed() async {
    Roles role = Roles(
        criador: 'Eduardo Vitor',
        nome_role: textControllers.controllerNome.text,
        local_curto: textControllers.controllerLocalcurto.text,
        descricao: textControllers.controllerDescricao.text,
        data: textControllers.controllerData.text,
        horario: textControllers.controllerHorario.text,
        custos: double.parse(textControllers.controllerCustos.text),
        obs: textControllers.controllerObservacoes.text,
        cep: textControllers.controllerCEP.text,
        imagem_local: textControllers.controllerImagem.text,
        idademin: int.parse(textControllers.controllerIdadeMin.text));
    bool isValid = _formkey.currentState!.validate();
    if (isValid) {
      await RoleDao().cadastrarRole(role);
    }
  }
}
