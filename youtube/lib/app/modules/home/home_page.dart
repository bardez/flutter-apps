import 'package:flutter/material.dart';
import 'package:youtube/app/modules/customSearchDelegate/CustomSearchDelegate.dart';
import 'package:youtube/app/modules/inicio/inicio_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      InicioPage(pesquisa: _resultado),
      Text("Em alta"),
      Text("Inscrição"),
      Text("Biblioteca"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "images/youtube.png",
          height: 22,
          width: 98,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () async {
            String response = await showSearch(context: context, delegate: CustomSearchDelegate());
            setState(() {
              _resultado = response; 
            });
          })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        fixedColor: Colors.red,
        items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Início")),
            BottomNavigationBarItem(icon: Icon(Icons.whatshot), title: Text("Em alta")),
            BottomNavigationBarItem(icon: Icon(Icons.subscriptions), title: Text("Inscrições")),
            BottomNavigationBarItem(icon: Icon(Icons.folder), title: Text("Biblioteca")),
        ]
      )
    );
  }
}
