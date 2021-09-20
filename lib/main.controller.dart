import 'dart:developer';

import 'package:dio/dio.dart';

class SearchController{
  List<dynamic> repoData =[];
  Future fetchData(String val)async{
    var dio = Dio();
    final response = await dio.get('https://api.github.com/search/repositories?q=$val');
    if(response.statusCode == 200){
      repoData = response.data['items'] as dynamic;
      log(repoData.toString());
    }
  }
}