import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'formulario.dart';

const _tituloAppBar = 'Transferência';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencia = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencia.length,
        itemBuilder: (
          context,
          indice,
        ) {
          final transferencia = widget._transferencia[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencia.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
