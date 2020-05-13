import 'package:flutter/material.dart';
import 'package:youtube/app/model/video_model.dart';
import 'package:youtube/app/persistence/api.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InicioPage extends StatefulWidget {
  final String title;
  final String pesquisa;
  const InicioPage({Key key, this.title = "Inicio", this.pesquisa = ""}) : super(key: key);

  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  
  _listarVideos(String pesquisa) {
    Api api = new Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return Center(
              child: CircularProgressIndicator()
            );          
            break;
          case ConnectionState.active :
          case ConnectionState.done :
            print(snapshot.hasData);
            if( snapshot.hasData ){

              return ListView.separated(
                itemBuilder: (context, index){
                  List<Video> videos = snapshot.data;
                  Video video = videos[index];
                  return GestureDetector(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: DotEnv().env['API_KEY'], 
                        videoId: video.id,
                        autoPlay: true,
                        // fullScreen: true,
                        appBarColor: Colors.red
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem)
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.descricao),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey
                ),
                itemCount: snapshot.data.length,
              );

            } else {
              return Center(
                child: Text('Nenhum dado a ser exibido.')
              );
            }
            break;
        }
      },
    );
  }
}
