import 'package:flutter/material.dart';
import "dart:convert";
import 'package:http/http.dart' as http;
// ignore: non_constant_identifier_names
//String name_pokemom;
void main(){
 runApp(Home());

}

class Home extends StatelessWidget{

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "pokedex",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(

     primaryColor: const Color.fromARGB(255, 6, 112, 86),
     visualDensity: VisualDensity.adaptivePlatformDensity,

   ),home: Homes(),

 );

  }

}



class Homes extends StatefulWidget {

    @override
    _Homestela createState()=> _Homestela();



}



class _Homestela extends State<Homes>{

 final TextEditingController _input = TextEditingController();

 @override

  Widget build(BuildContext context){
   return Scaffold(
   appBar: AppBar(

    title:Center(child: Text("Pokeden top"),),

   // backgroundColor: // Image.asset('a', fit: BoxFit.cover),

 ),body: TextField(

        maxLines: 1,

        controller: _input,

        decoration: InputDecoration(
        hintText: "buscar",
        filled: true,
        suffixIcon: IconButton(onPressed: (){





        },icon: Icon(Icons.search)),
         border: OutlineInputBorder(
         borderSide: BorderSide(width: 80),
         borderRadius: BorderRadius.circular(20))
        
         )

         )
     );

     

    }

    

}

class view extends StatefulWidget{
    @override
    _viewcontrole createState() => _viewcontrole();
    
}

class _viewcontrole extends State<view>{
  final TextEditingController _input = TextEditingController();
  @override
    Widget build(BuildContext context){
        return Scaffold(
        appBar:AppBar(
          title:Center(
          child:Text('Seu pokemom é')
          
          )
        ),
        body:
        TextField(
          maxLines: 1,
          controller: _input,
          decoration: InputDecoration(

          hintText: "buscar",

          filled: true,

          suffixIcon: IconButton(onPressed: (){



            },icon: Icon(Icons.search)),
          border: OutlineInputBorder(
          borderSide: BorderSide(width: 80),
          borderRadius: BorderRadius.circular(20))
              
          )
              )
              );
          }
          
}
/*
class view_pokemom extends StatefulWidget {
    
      @override
      _view_pokemoms createState() => _view_pokemoms();
    
}

class _view_pokemoms extends State<view_pokemom>{


    
    
    @override
    Widget build(BuildContext context){
        return Scaffold(
          body:/*childrem[
            //image 
            Text(nome_pokem)
          
          ]
        */
        
        );
    }
    
    
    
}

*/

class add_pokemom extends StatefulWidget{
    @override
    _add_pokemoms createState() => _add_pokemoms();
    
}



class _add_pokemoms extends State<add_pokemom>{
    
    @override
    Widget build(BuildContext context){
        
        return Scaffold(
         appBar:AppBar(
         title:Text('adicione seu pokemom'),
         //leadong:Icon(Icon.<)
         
         
         ),
        
        
        );
        
    }
    
    
}

















/*import 'package:flutter/material.dart';

void main(){
  runApp(Home());
}
class Home extends StatelessWidget{
   @override
  Widget build(BuildContext context) {

   return MaterialApp(
      title: "pokedex",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 6, 112, 86),
        visualDensity:  VisualDensity.adaptivePlatformDensity,
      ),home: Homes(),
   );
  }
}

class Homes extends StatefulWidget {
  @override
  _Homestela createState()=> _Homestela();
  
}

class _Homestela extends State<Homes>{
  final TextEditingController _input = TextEditingController();
  @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text("Pokeden top"),),
       // backgroundColor: // Image.asset('a', fit: BoxFit.cover),

      ),body: TextField(
          maxLines: 1,
          controller: _input,
          decoration: InputDecoration(
          hintText: "buscar",
          filled: true,

          suffixIcon: IconButton(onPressed: (){
            

          },icon: Icon(Icons.search)),
          filled: true,
          border: OutlineInputBorder(
          borderSide: BorderSide(width: 80),
          borderRadius: BorderRadius.circular(20))
          )
          
          )
        )

      ),
    );
   }

} */