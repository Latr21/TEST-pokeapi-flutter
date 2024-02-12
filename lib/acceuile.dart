import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaSuperApp());
}

class MaSuperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokeAPI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageAccueil(),
    );
  }
}

class PageAccueil extends StatefulWidget {
  @override
  _PageAccueilState createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  late List<dynamic> _listePokemon;

  @override
  void initState() {
    super.initState();
    obtenirDonneesPokemon();
  }

  Future<void> obtenirDonneesPokemon() async {
    final reponse = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=10'));
    if (reponse.statusCode == 200) {
      final donneesDecodees = json.decode(reponse.body);
      setState(() {
        _listePokemon = donneesDecodees['results'];
      });
    } else {
      throw Exception('echec du chargement des donnes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeAPI - Les 10 premiers Pokemo'),
      ),
      body: _listePokemon != null
          ? ListView.builder(
              itemCount: _listePokemon.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_listePokemon[index]['name']),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
