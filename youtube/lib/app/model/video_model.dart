class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String pageToken;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.pageToken});
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["channelTitle"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      pageToken: json["nextPageToken"]
    );
  }
}