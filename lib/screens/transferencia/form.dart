import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Criando transferência';

const _labelValue = 'Valor';
const _placeholderValue = '0.00';

const _labelAccount = 'Número da conta';
const _placeholderAccount = '0000';

const _buttonConfirmText = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Editor(
              controller: _controllerFieldAccountNumber,
              label: _labelAccount,
              text: _placeholderAccount),
          Editor(
              controller: _controllerFieldValue,
              label: _labelValue,
              text: _placeholderValue,
              icon: Icons.monetization_on),
          ElevatedButton(
              onPressed: () => _transferMoney(context),
              child: Text(_buttonConfirmText))
        ]),
      ),
    );
  }

  void _transferMoney(BuildContext context) {
    final int? accountNumber = int.tryParse(_controllerFieldAccountNumber.text);
    final double? value = double.tryParse(_controllerFieldValue.text);
    if (accountNumber != null && value != null) {
      final transferenciaCreated = Transferencia(value, accountNumber);
      debugPrint(transferenciaCreated.toString());
      Navigator.pop(context, transferenciaCreated);
    }
  }
}
