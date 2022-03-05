import 'package:rolesapp/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:rolesapp/data/role_dao.dart';
import 'package:rolesapp/domain/roles.dart';

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
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerLocalcurto = TextEditingController();
  TextEditingController controllerDescricao = TextEditingController();
  TextEditingController controllerData = TextEditingController();
  TextEditingController controllerHorario = TextEditingController();
  TextEditingController controllerCustos = TextEditingController();
  TextEditingController controllerObservacoes = TextEditingController();
  TextEditingController controllerCEP = TextEditingController();
  TextEditingController controllerImagem = TextEditingController();
  TextEditingController controllerEstado = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerRua = TextEditingController();
  TextEditingController controllerBairro = TextEditingController();
  TextEditingController controllerNumero = TextEditingController();
  TextEditingController controllerComplemento = TextEditingController();
  TextEditingController controllerIdadeMin = TextEditingController();
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
            controller: controllerNome,
          ),
          const SizedBox(height: 15),
          MyFormInput(
            label: 'Local curto',
            hint: 'Digite o local de forma curta',
            validator: checkFieldEmpty,
            controller: controllerLocalcurto,
          ),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Descrição',
              hint: 'Digite a descrição',
              validator: checkFieldEmpty,
              controller: controllerDescricao),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Data',
              hint: 'Digite a data',
              validator: checkFieldEmpty,
              controller: controllerData),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Horário',
              hint: 'Digite o horário',
              validator: checkFieldEmpty,
              controller: controllerHorario),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Custos',
              hint: 'Digite qual o custo do rolê',
              validator: checkFieldEmpty,
              controller: controllerCustos),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Observações (opcional)',
              hint: 'Digite alguma observação relevante',
              controller: controllerObservacoes),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'CEP',
              hint: 'Digite o CEP do local',
              validator: checkFieldEmpty,
              controller: controllerCEP),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Imagem do local',
              hint:
                  'Copie uma url de uma imagem da internet que represente o local',
              validator: checkFieldEmpty,
              controller: controllerImagem),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Estado',
              hint: 'Digite o nome do estado por extenso',
              validator: checkFieldEmpty,
              controller: controllerEstado),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Cidade',
              hint: 'Digite o nome da cidade',
              validator: checkFieldEmpty,
              controller: controllerCidade),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Rua',
              hint: 'Digite a rua do local',
              validator: checkFieldEmpty,
              controller: controllerRua),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Bairro',
              hint: 'Digite o bairro do local',
              validator: checkFieldEmpty,
              controller: controllerBairro),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Número',
              hint: 'Digite o número do local',
              validator: checkFieldEmpty,
              controller: controllerNumero),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Complemento (opcional)',
              hint: 'Digite algum complemento',
              controller: controllerComplemento),
          const SizedBox(height: 15),
          MyFormInput(
              label: 'Idade mínima',
              hint: 'Digite a idade mínima',
              validator: checkFieldEmpty,
              controller: controllerIdadeMin),
          const SizedBox(height: 15),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 40),
                primary: CustomColors.purple,
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
        nome_role: controllerNome.text,
        local_curto: controllerLocalcurto.text,
        descricao: controllerDescricao.text,
        data: controllerData.text,
        horario: controllerHorario.text,
        custos: double.parse(controllerCustos.text),
        obs: controllerObservacoes.text,
        cep: controllerCEP.text,
        imagem_local: controllerImagem.text,
        estado: controllerEstado.text,
        cidade: controllerCidade.text,
        rua: controllerRua.text,
        bairro: controllerBairro.text,
        numero: controllerNumero.text,
        comp: controllerComplemento.text,
        idademin: int.parse(controllerIdadeMin.text));
    bool isValid = _formkey.currentState!.validate();
    bool role_cadastrado = await RoleDao().cadastrarRole(role);
    if (isValid && role_cadastrado) {
      print('Rolê cadastrado');
    }
  }
}
