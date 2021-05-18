import 'dart:convert';
import 'dart:html';

import 'package:covtrack_app_uas/animation/bottomAnimation.dart';
import 'package:covtrack_app_uas/controller/covidAPI.dart';
import 'package:covtrack_app_uas/customWidgets/customLoader.dart';
import 'package:covtrack_app_uas/customWidgets/homeTile.dart';
import 'package:covtrack_app_uas/model/homeCountryDataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Indonesia extends StatefulWidget {
  @override
  _IndonesiaState createState() => _IndonesiaState();
}
//{"country":"Indonesia","cases":1748230,"todayCases":4185,"deaths":48477,"todayDeaths":172,"recovered":1612239,"active":87514,"critical":0,"casesPerOneMillion":6333,"deathsPerOneMillion":176,"totalTests":15653438,"testsPerOneMillion":56705},
class _IndonesiaState extends State<Indonesia> with TickerProviderStateMixin {

  Future<List<User>> _getUsers() async{
    var data = await http.get('https://api.kawalcorona.com/indonesia');
    var jsonData = json.decode(data.body);

   List<User> users = [];

   for(var u in jsonData){
     User user = User(u["name"],u["positif"],u["sembuh"],u["meninggal"],u["dirawat"]);
     users.add(user);
   }
    print(users);
   return users;

  }

  @override
  void initState() {
    _getUsers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flag(height),
          FutureBuilder(
            future: _getUsers(),
            builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Text(snapshot.data[index].name),
                        Text(snapshot.data[index].positif),
                      ],
                    );
                  },
                );
            },
          )
        ],
      ),
    ));
  }
}

class Flag extends StatelessWidget {

  final double height;
  Flag(this.height);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
    CircleAvatar(
    maxRadius: height * 0.123,
      backgroundColor: Colors.orangeAccent,
      child: CircleAvatar(
        maxRadius: height * 0.12,
        backgroundImage: NetworkImage("https://cdn.britannica.com/48/1648-004-A33B72D8/Flag-Indonesia.jpg"),
      )),
        Text(
          "INDONESIA",
          style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: MediaQuery.of(context).size.height * 0.05),
        ),
      ],
    );
  }
}

class User{

int name;
int positif;
int sembuh;
int meninggal;
int dirawat;

User(this.name, this.positif, this.sembuh, this.meninggal, this.dirawat);

}