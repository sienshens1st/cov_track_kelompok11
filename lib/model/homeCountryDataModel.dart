class HomeStats {
  final String positif;
  final String dirawat;
  final String sembuh;
  final String meninggal;
  final String lastUpdate;

  HomeStats(
      {this.positif, this.dirawat, this.sembuh, this.meninggal, this.lastUpdate});

  factory HomeStats.fromJSON(Map<String, dynamic> json) {
    return HomeStats(
      positif :json['positif'].toString(),
      dirawat: json ['dirawat'].toString(),
      sembuh :json['sembuh'].toString(),
      meninggal :json['meninggal'].toString(),
      lastUpdate :json['lastUpdate'].toString(),
    );
  }
}
