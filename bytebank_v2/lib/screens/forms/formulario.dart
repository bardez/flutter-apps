import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget{
  
  final TextEditingController _textEditingControllerConta = TextEditingController();
  final TextEditingController _textEditingControllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Transfer'),),
      body: Column(
        children: [
          Editor(controller: _textEditingControllerConta, rotulo: 'Account number', dica: '00000', keyboardType: TextInputType.text),
          Editor(controller: _textEditingControllerValor, rotulo: 'Amount', dica: '00.0', icon : Icons.monetization_on, keyboardType: TextInputType.number),
          ElevatedButton(
            child: Text('Confirm'),
            onPressed: ()=> criarTransferencia(context)
          )
        ],
      )
    ); 
  }

  void criarTransferencia(BuildContext context) {
    final int conta = int.tryParse(_textEditingControllerConta.text);
    final double valor = double.tryParse(_textEditingControllerValor.text);
    if(conta != null && valor != null){
      final Transferencia transferencia = Transferencia(valor, conta);
      Navigator.pop(context, transferencia); 
    }
  }
}
