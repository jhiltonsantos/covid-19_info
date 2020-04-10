import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const request_covid = "https://covid19.mathdro.id/api";

Future<Map> getData() async {
  http.Response response = await http.get(request_covid);
  return json.decode(response.body);
}

const request_brazil = "https://covid19.mathdro.id/api/countries/brazil";

Future<Map> getDataBrazil() async {
  http.Response response = await http.get(request_brazil);
  return json.decode(response.body);
}

const request_new = "http://newsapi.org/v2/top-headlines?country=br&q=coronav%C3%ADrus&category=health&apiKey=10e1b3c6f01b4a74a73f6a1c82a0ac87";
Future<Map> getDataNews() async {
  http.Response response = await http.get(request_new);
  return json.decode(response.body);
}