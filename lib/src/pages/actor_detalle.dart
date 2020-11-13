

import 'package:flutter/material.dart';
import 'package:peliculas/src/models/actores_model.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';


class DetalleActor extends StatelessWidget {
    final peliculasProvider= new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    
    final Actor actor= ModalRoute.of(context).settings.arguments;
  final pelicula= Pelicula();
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrera actoral'),
         backgroundColor: Colors.indigoAccent
      ) ,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: 15.0,),
                _fichaActor(context,actor),
                Divider(),
                
               // pelicula.getPosterImg()
                //Text('Filmografía'),
              // _pelisActuadas(context,actor),
              ]),
              )
          ],
        )
      );
  }

 Widget  _fichaActor(BuildContext context, Actor actor) {
return Container(
  padding: EdgeInsets.symmetric(horizontal: 20.0),
  child: Row(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image(
          image: NetworkImage(actor.getFoto()),
          height: 160.0,
        ),
        ),
        Flexible(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(actor.name,style: Theme.of(context).textTheme.title,overflow: TextOverflow.ellipsis,),
              Text(actor.character,style: Theme.of(context).textTheme.subtitle1, overflow: TextOverflow.ellipsis,)
             
            ],
          ) ,
          ),
    ],
  ),
);
  }

//  Widget  _pelisActuadas(BuildContext context,Actor actor) {
//    return FutureBuilder(
//      future: peliculasProvider.buscarPeliculasActuadas(actor.name),
//      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot){
//        if(snapshot.hasData){
//         final peliculas= snapshot.data;
//         return ListView(
//           shrinkWrap: true,
//           children: peliculas.map((pelicula){
//             return ListTile(
//              leading: FadeInImage(
//                 image: NetworkImage(pelicula.getPosterImg()),
//                 placeholder: AssetImage('assets/img/no-image.jpg'),
//                 width: 50.0,
//                 fit: BoxFit.contain,
                
//               ),
            
              
//             );
//           }).toList(),
//         );

//      }else{
//         return Center(
//           child: CircularProgressIndicator()
//         );
//       }
//      },
//      );
//  }

 

 
}