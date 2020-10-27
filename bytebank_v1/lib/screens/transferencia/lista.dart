import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List();
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia>{
  
  @override
  Widget build(BuildContext context) {
    widget._transferencias.add(Transferencia(100.00, 123456));
    widget._transferencias.add(Transferencia(200.00, 123456));
    widget._transferencias.add(Transferencia(300.00, 123456));
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length ,
        itemBuilder: (context, indice){
          print(widget._transferencias.length);
          return ItemTransferencia(widget._transferencias[indice]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          final Future<Transferencia> callback = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          callback.then((recebida) {
            debugPrint('$recebida');
            setState(() {
              widget._transferencias.add(recebida);
            });
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text('R\$' + _transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      )
    );
  }
  
}
