import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toggle_switch/toggle_switch.dart';
import 'package:sqflite/sqflite.dart';

//  flutter pub add sqflite
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
void Add_poke(numero){
  
}
class PokedexScreen extends StatefulWidget {
  @override
  _PokedexScreenState createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  Pokemon? pokemon;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  Future<void> fetchPokemon(String pokemonName) async {
    setState(() {
      isLoading = true;
      pokemon = null;
    });

    final url = Uri.parse(
        'https://pokeapi.co/api/v2/pokemon/${pokemonName.toLowerCase()}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        pokemon = Pokemon.fromJson(jsonDecode(response.body));
        isLoading = false;
      });
    } else {
      setState(() {
        pokemon = null;
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pokémon não encontrado!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          title: Center(
            child: Text(
              "Pokeden top",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          flexibleSpace: Image(
            image: AssetImage('assets/images/pokemom.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
                maxLines: 1,
                controller: searchController,
                decoration: InputDecoration(
                    hintText: "buscar",
                    filled: true,
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (searchController.text.isNotEmpty) {
                            fetchPokemon(searchController.text);
                          }
                        },
                        icon: Icon(Icons.search)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 80),
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : pokemon == null
                    ? Text('Nenhum Pokémon encontrado')
                    : GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonDetailScreen(pokemon: pokemon!),
                            ),
                          );
                        },
                        child:Container(
                       /*   decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              //color:  const Color.fromARGB(255, 255, 255, 255)
                            )
                          ),*/
                             child:  Column(
                          children: [
                     
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
             
                                      Text(
                              pokemon!.name.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                                  
                          ),IconButton(onPressed: (){

                          }, icon: Icon(Icons.star,color: Colors.amber,))

         
                              ],
                            )
                           ,

               
                            Image.network(pokemon!.imageUrl),
                            Text("ID: ${pokemon!.id}"),
                            Text("Tipos: ${pokemon!.types.join(', ')}"),
                           
                               IconButton(onPressed: (){

                               }, icon: Icon(Icons.catching_pokemon_outlined,
                    size: 30, color: const Color.fromARGB(255, 204, 16, 16)))
                            
           ] ),

                        )
                    
                      ),
          ],
        ),
      ),
    );
  }
}

class Pokemon {
  final String name;
  final int id;
  final String imageUrl;
  final List<String> types;
  final int hp;
  final int attack;
  final double height;
  final double weight;

  Pokemon({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.types,
    required this.hp,
    required this.attack,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      imageUrl: json['sprites']['front_default'],
      types: (json['types'] as List)
          .map((t) => t['type']['name'].toString())
          .toList(),
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      height: json['height'].toDouble(),
      weight: json['weight'].toDouble(),
    );
  }
}

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(pokemon.imageUrl),
            Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("ID: ${pokemon.id}"),
            Text("Tipos: ${pokemon.types.join(', ')}"),
            Text("Vida (HP): ${pokemon.hp}"),
            Text("Força (Ataque): ${pokemon.attack}"),
            Text("Altura: ${pokemon.height / 10} m"),
            Text("Peso: ${pokemon.weight / 10} kg"),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "pokedex",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 6, 112, 86),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homes(),
    );
  }
}

class Homes extends StatefulWidget {
  @override
  _Homestela createState() => _Homestela();
}

class _Homestela extends State<Homes> {
  //final TextEditingController _input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            title: Center(
              child: Text(
                "Pokeden top",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            flexibleSpace: Image(
              image: AssetImage('assets/images/poke.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                ToggleSwitch(
                  initialLabelIndex: null,
                  totalSwitches: 3,
                  minWidth: 200.0,
                  minHeight: 100.0,
                  isVertical: true,
                  activeBgColor: [const Color.fromARGB(255, 56, 78, 139)],
                  activeFgColor: Colors.white,
                  inactiveBgColor: const Color.fromARGB(255, 221, 218, 224),
                  inactiveFgColor: Colors.grey[900],
                  labels: [
                    'Procurar Pokemons',
                    'Adicionar Pokemons',
                    'Configuraçãoes'
                  ],
                  onToggle: (index) {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokedexScreen()),
                      );
                    }
                    if (index == 1) {
                      Navigator.push(   
                          context,
                          MaterialPageRoute(
                              builder: (context) => add_pokemom()));
                    }
                  },
                ),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                ToggleSwitch(
                  initialLabelIndex: null,
                  totalSwitches: 2,
                  minWidth: 200.0,
                  minHeight: 100.0,
                  isVertical: true,
                  activeBgColor: [const Color.fromARGB(255, 56, 78, 139)],
                  activeFgColor: Colors.white,
                  inactiveBgColor: const Color.fromARGB(255, 221, 218, 224),
                  inactiveFgColor: Colors.grey[900],
                  labels: ['Favoridos', "meus pokemons"],
                  onToggle: (index) {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokedexScreen()),
                      );
                    }
                    if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => add_pokemom()));
                    }
                  },
                ),
              ]),
            ],
          ),
        ));
  }
}

class add_pokemom extends StatefulWidget {
  @override
  _add_pokemoms createState() => _add_pokemoms();
}

class _add_pokemoms extends State<add_pokemom> {
  TextEditingController _neme = TextEditingController();
  TextEditingController _foto = TextEditingController();
  TextEditingController _tipo = TextEditingController();
  TextEditingController _vida = TextEditingController();
  TextEditingController _forca = TextEditingController();
  TextEditingController _peso = TextEditingController();
  TextEditingController _altura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child: AppBar(
              title: Center(
                child: Text("Qual  e o seu pokemom",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
              ),
              flexibleSpace: Image(
                  image: AssetImage("images/imageadd.png"), fit: BoxFit.cover),
            )),
        body: Padding(
          padding: const EdgeInsets.all(120.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                  maxLines: 1,
                  controller: _neme,
                  decoration: InputDecoration(
                    hintText: "Nome",
                    filled: true,
                  )),
              TextField(
                  maxLines: 1,
                  controller: _foto,
                  decoration: InputDecoration(
                    hintText: "Foto",
                    filled: true,
                  )),
              TextField(
                  maxLines: 1,
                  controller: _tipo,
                  decoration: InputDecoration(
                    hintText: "Tipo",
                    filled: true,
                  )),
              TextField(
                  maxLines: 1,
                  controller: _vida,
                  decoration: InputDecoration(
                    hintText: "Vida",
                    filled: true,
                  )),
              TextField(
                  maxLines: 1,
                  controller: _forca,
                  decoration: InputDecoration(
                    hintText: "Força",
                    filled: true,
                  )),
              TextField(
                  maxLines: 1,
                  controller: _peso,
                  decoration: InputDecoration(
                    hintText: "Peso",
                    filled: true,
                  )),
              TextField(
                  maxLines: 1,
                  controller: _altura,
                  decoration: InputDecoration(
                    hintText: "Altura",
                    filled: true,
                  )),
            ],
          ),
        ));
  }
}

/*
class favoride extends StatefulWidget{
    @override
    _view_favoride createState() => _view_favoride();
    
    
}

class _view_favoride State<favoride>{
    
    @override
    Widget build(BuildContext context){
        return Scaffold(
        appBar:AppBar(title: Text("data"),)
        ,body: Text("data"),
        
        
        
        );
    }
    
}







*/
















































































