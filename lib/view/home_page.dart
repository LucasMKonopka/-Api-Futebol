import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trabalho2/view/rodadas_page.dart';
import 'package:trabalho2/view/tabela_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/logowhite.png',
                fit: BoxFit.contain, height: 50),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.center, 
          children: <Widget>[
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20), 
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.black, width: 2), 
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, 
                  children: <Widget>[
                    Text(
                      "Tabela Classificação",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabelaPage()),
                );
              },
            ),
            SizedBox(height: 40), 
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10), 
                ),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, 
                  children: <Widget>[
                    Text(
                      "Rodada Campeonato",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RodadasPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
