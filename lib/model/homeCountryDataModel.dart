class HomeStats {
  int name;
  int positif;
  int sembuh;
  int meninggal;
  int dirawat;

  HomeStats(
      {this.name, this.positif, this.sembuh, this.meninggal, this.dirawat});

  HomeStats.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    positif = json['positif'];
    sembuh = json['sembuh'];
    meninggal = json['meninggal'];
    dirawat = json['dirawat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['positif'] = this.positif;
    data['sembuh'] = this.sembuh;
    data['meninggal'] = this.meninggal;
    data['dirawat'] = this.dirawat;
    return data;
  }
}
