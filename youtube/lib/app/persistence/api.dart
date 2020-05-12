import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/app/model/video_model.dart';

const API_KEY = 'AIzaSyArCF_wZl0FC3brTd561rMtfmiNpJ9uTAQ';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async{
    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$API_KEY"
      "&q=$pesquisa"
    );
    print(response.body);
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