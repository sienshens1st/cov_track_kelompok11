import 'package:covtrack_app_uas/animation/bottomAnimation.dart';
import 'package:covtrack_app_uas/customWidgets/customLoader.dart';
import 'package:covtrack_app_uas/my_icons_icons.dart';
import 'package:covtrack_app_uas/views/countriesDetails.dart';
import 'package:flutter/material.dart';
import 'package:covtrack_app_uas/controller/covidAPI.dart';
import 'package:intl/intl.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  final formatter = NumberFormat("###,###");
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Covid-19 Country Cases",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'MyFont',
              fontSize: 20,
            ),
          ),
          shadowColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: 0.5,
                  child: Image.asset(
                    'images/covidGreen.png',
                    height: height * 0.2,
                  ),
              ),
            ),
            Positioned(
              top: height * 0.5,
              right: width * 0.7,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        'images/covidRed.png',
                        height: height * 0.2,
                      ),
                    ),
                  ),
            Positioned(
              top: height * 0.4,
              right: width * 0.1,
              child : Opacity(
                opacity: 0.5,
              child: Image.asset(
                'images/covidBlue.png',
                height: height * 0.2,
              ),
              ),
            ),
            Expanded(
              child: Container(
                width: width,
                height: height,
                child: FutureBuilder(
                  future: CovidAPI().getCountryData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04, vertical: height * 0.02),
                        itemCount: snapshot.data.countries.length,
                        itemBuilder: (context, index) {
                          return WidgetAnimator(Card(
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                            shadowColor: Colors.blue,
                            child: ListTile(
                              leading: Icon(MyIcons.globe_outline,size: height * 0.03),
                              trailing: Icon(Icons.play_arrow, size: height * 0.02),
                              title: Text(snapshot.data.countries[index].countryName),
                              subtitle: Text(
                                  "Cases: ${formatter.format(snapshot.data.countries[index].countryCases)}"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountryDetails(
                                              countryName: snapshot
                                                  .data.countries[index].countryName,
                                              totalCases: snapshot
                                                  .data.countries[index].countryCases,
                                              totalRecoverd: snapshot.data
                                                  .countries[index].countryRecovered,
                                              totalDeaths: snapshot.data
                                                  .countries[index].countryDeaths,
                                              todayCases: snapshot
                                                  .data.countries[index].todayCases,
                                              todayDeaths: snapshot
                                                  .data.countries[index].todayDeaths,
                                              activeCases: snapshot
                                                  .data.countries[index].activeCases,
                                              cCases: snapshot
                                                  .data.countries[index].critCases,
                                              totalTests: snapshot
                                                  .data.countries[index].totalTests,
                                            )));
                              },
                            ),
                          ));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else {
                      return Center(
                        child: VirusLoader(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}