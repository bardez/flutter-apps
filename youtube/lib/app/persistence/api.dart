import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/app/model/video_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async{
    http.Response response = await http.get(
      DotEnv().env['YOUTUBE_URL'] + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=${DotEnv().env['API_KEY']}"
      "&q=$pesquisa"
    );
    if(response.statusCode == 200){
      Map<String, dynamic> dados = json.decode(response.body);
      List<Video> videos = dados["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();
      return videos;
    }
  }

}