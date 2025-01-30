import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DB {
   DB._();
   static final DB instanc = DB._();
   static Database? _database;
   get database async {
    if (_database !=  null )return _database;
    return await _initDatabase();
   }
   _initDatabase() async{
    return await openDatabase(
      join(await getDatabasesPath(),"pokemons_dl"),
      version: 1,
      onCreate: _onCreate,

    );
   }
   _onCreate (db,version)async{
    await db.execute(_favorride);
    await db.execute(_pokemom_cp);
    await db.execute(_meuspoke);

    await db.insert('favorido',{"ids":[]});
   }
   String  get _favorride => '''
       CREATE TABLE favorido (
       id INTERGER PRIMARY KEY AUTOINCREMENT,
       ids LIST
      
       

       )
    
  ''';

String  get  _pokemom_cp => '''
       CREATE TABLE capiturados (
       id INTERGER PRIMARY KEY AUTOINCREMENT,
       ids TEXT,
       nome TEXT,
       foto  TEXT,
       vida  TEXT,
       forca  TEXT,
       peso  TEXT, 
       altura  TEXT,
       )
    
  ''';
String  get  _meuspoke => '''
       CREATE TABLE capiturados (
       id INTERGER PRIMARY KEY AUTOINCREMENT,
       ids TEXT,
       nome TEXT,
       foto  TEXT,
       vida  TEXT,
       forca  TEXT,
       peso  TEXT, 
       altura  TEXT,
       )
    
  ''';
}
class ContaRepository extends ChangeNotifier{
  late Database db;
  List <Posicao> _carteira =[]
  double _saldo = 0 ;
  get saldo =>_saldo 
}

class Posicao{
   Moeda moeda;
  double quantidade;
  Posicao({required this.moeda,required this.quantidade});

}