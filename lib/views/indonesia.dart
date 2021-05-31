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
          FutureBuilder<HomeStats>(
            future: CovidAPI().getIndonesiaCase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: height * 0.4155,
                  child: Center(
                    child: VirusLoader(),
                  ),
                );
              }else{
                int positif = int.parse(snapshot.data.positif);
                int dirawat = int.parse(snapshot.data.dirawat);
                int sembuh = int.parse(snapshot.data.sembuh);
                int meninggal = int.parse(snapshot.data.meninggal);
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Last Update: ${snapshot.data.lastUpdate.substring(0, 10)} ${snapshot.data.lastUpdate.substring(11, 19)}",
                          style: TextStyle(
                              fontFamily: 'MyFont',
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Icon(Icons.refresh))
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        WidgetAnimator(
                          HomeTile(
                            caseCount: positif,
                            infoHeader: 'Cases',
                            tileColor: Colors.blueAccent,
                          ),
                        ),
                        WidgetAnimator(
                          HomeTile(
                            caseCount: sembuh,
                            infoHeader: 'Recoveries',
                            tileColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        WidgetAnimator(
                          HomeTile(
                            caseCount: meninggal,
                            infoHeader: 'Deaths',
                            tileColor: Colors.redAccent,
                          ),
                        ),
                        WidgetAnimator(
                          HomeTile(
                            caseCount: dirawat,
                            infoHeader: 'Positive',
                            tileColor: Colors.orangeAccent,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "Hang in there, as better times are ahead.",
                      style: TextStyle(
                          fontFamily: 'MyFont', fontWeight: FontWeight.bold),
                    )
                  ],
                );
              }
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
      backgroundColor: Colors.blue,
      child: CircleAvatar(
        maxRadius: height * 0.12,
        backgroundImage:AssetImage("images/indoFlag.png"),
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
