import 'package:flutter/material.dart';
import 'package:trabalho2/service/fut_service.dart';

class RodadasPage extends StatefulWidget {
  const RodadasPage({Key? key}) : super(key: key);

  @override
  _RodadasPageState createState() => _RodadasPageState();
}

class _RodadasPageState extends State<RodadasPage> {
  late Future<List<dynamic>> _rodadas;

  @override
  void initState() {
    super.initState();
    _rodadas = getRodadas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rodada do Campeonato Brasileiro'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _rodadas,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhuma informação disponível"));
          } else {
            return exibeRodadas(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget exibeRodadas(List<dynamic> rodadas) {
    return ListView.builder(
      itemCount: rodadas.length,
      itemBuilder: (context, index) {
        final rodada = rodadas[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rodada['nome'] ?? 'Sem nome',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Status: ${rodada['status'] ?? 'Desconhecido'}"),
                if (rodada['proxima_rodada'] != null) ...[
                  SizedBox(height: 8),
                  Text("Próxima Rodada: ${rodada['proxima_rodada']['nome']}"),
                ],
                if (rodada['rodada_anterior'] != null) ...[
                  SizedBox(height: 8),
                  Text("Rodada Anterior: ${rodada['rodada_anterior']['nome']}"),
                ],
                SizedBox(height: 8),
                Text("Link: ${rodada['_link'] ?? 'Sem link'}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
