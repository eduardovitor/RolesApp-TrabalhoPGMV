import 'package:rolesapp/custom_colors.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: ListView(padding: const EdgeInsets.all(16), children: <Widget>[
          const SizedBox(height: 30),
          const MyFormInput(
              label: 'Nome', hint: 'Digite o nome', validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Local curto',
              hint: 'Digite o local de forma curta',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Descrição',
              hint: 'Digite sua data de nascimento',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Data', hint: 'Digite a data', validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Horário',
              hint: 'Digite o horário',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Custos',
              hint: 'Digite qual o custo do rolê',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Observações (opcional)',
              hint: 'Digite alguma observação relevante',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'CEP',
              hint: 'Digite o CEP do local',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Imagem do local',
              hint:
                  'Copie uma url de uma imagem da internet que represente o local',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Rua',
              hint: 'Digite a rua do local',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Bairro',
              hint: 'Digite o bairro do local',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Número',
              hint: 'Digite o número do local',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Complemento (opcional)',
              hint: 'Digite algum complemento',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          const MyFormInput(
              label: 'Idade mínima',
              hint: 'Digite a idade mínima',
              validator: checkFieldEmpty),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
                primary: CustomColors.purple,
                onPrimary: Colors.white,
                //  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              ),
              onPressed: () {},
              child: const Text("Criar rolê")),
        ]));
  }
}
