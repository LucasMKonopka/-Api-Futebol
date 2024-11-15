import 'package:flutter/material.dart';
import 'package:trabalho2/service/fut_service.dart';

class TabelaPage extends StatefulWidget {
  @override
  _TabelaPageState createState() => _TabelaPageState();
}

class _TabelaPageState extends State<TabelaPage> {
  late Future<List<dynamic>> _tabela;

  @override
  void initState() {
    super.initState();
    _tabela = getTabela(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabela de Classificação"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _tabela,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Nenhuma informação disponível"));
          } else {
            return exibeTabela(snapshot);
          }
        },
      ),
    );
  }

  Widget exibeTabela(AsyncSnapshot<List<dynamic>> snapshot) {
    final List tabela = snapshot.data!;
    
    return ListView.builder(
      itemCount: tabela.length,
      itemBuilder: (context, index) {
        final time = tabela[index];
        final nomeTime = time['time']['nome_popular'];
        final escudo = time['time']['escudo'];
        final posicao = time['posicao'];
        final pontos = time['pontos'];

        return Card(
          child: ListTile(
            leading: Image.network(escudo, width: 40, height: 40),
            title: Text("$posicaoº - $nomeTime"),
            subtitle: Text("Pontos: $pontos"),
          ),
        );
      },
    );
  }
}
