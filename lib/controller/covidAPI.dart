import 'dart:convert';
import 'package:covtrack_app_uas/model/globalDataModel.dart';
import 'package:covtrack_app_uas/model/homeCountryDataModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:covtrack_app_uas/model/countryDataModel.dart';

class CovidAPI {

  Future<GlobalData> getCase() async {
    String url = 'https://coronavirus-19-api.herokuapp.com/all';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return GlobalData.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed to load Post");
    }
  }


  Future<HomeStats> getIndonesiaCase() async {
    var url = 'https://apicovid19indonesia-v2.vercel.app/api/indonesia';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var datas = json.decode(response.body);
      return HomeStats.fromJSON(datas);
    } else {
      throw Exception("Failed to load Post");
    }
  }

    Future<CountryDataList> getCountryData() async {
      String url = 'https://coronavirus-19-api.herokuapp.com/countries';
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonRes = json.decode(response.body);
        return CountryDataList.fromJson(jsonRes);
      } else {
        throw Exception("Failed due to Network Error");
      }
    }
  }
