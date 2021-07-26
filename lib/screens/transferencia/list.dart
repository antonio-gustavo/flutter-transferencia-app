import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'form.dart';

const _titleAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> _transferencias = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          return ItemTransferencia(widget._transferencias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioTransferencia(),
                )).then(
              (transferReceived) => {_reload(transferReceived)},
            );
          }),
    );
  }

  void _reload(Transferencia? transferReceived) {
    if (transferReceived != null)
      setState(() {
        widget._transferencias.add(transferReceived);
      });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia? _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia!.value.toString()),
        subtitle: Text(_transferencia!.accountNumber.toString()),
      ),
    );
  }
}
