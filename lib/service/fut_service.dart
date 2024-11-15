import 'dart:convert';

import 'package:http/http.dart' as http;


const String baseUrl = 'https://api.api-futebol.com.br/v1';
const String _key = 'live_77eaa8711ae530236bcc6b6b20cf03';

Future<List<dynamic>> getTabela() async {
  final url = Uri.parse('https://api.api-futebol.com.br/v1/campeonatos/10/tabela');
  final response = await http.get(url, headers: {'Authorization': 'Bearer $_key'});
  print(json.decode(response.body));
  
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Erro ao carregar a tabela');
  }
}

Future<List<dynamic>> getRodadas() async {
  final url = Uri.parse('https://api.api-futebol.com.br/v1/campeonatos/10/rodadas');
  final response = await http.get(url, headers: {'Authorization': 'Bearer live_77eaa8711ae530236bcc6b6b20cf03'});
  print(json.decode(response.body));
      

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Erro ao carregar a rodada');
  }
}



