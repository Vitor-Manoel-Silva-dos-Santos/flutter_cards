// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';

import 'package:flutter_cards_aplication/reclamacoes.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import 'lista_beneficios.dart';
import 'qr_image.dart';

void main() {
  runApp(MaterialApp(home: cardExpandido(),));
}
var contador = 0;
class imgMuda extends State<cardExpandido>{
  
  final imgList = [  
    'assets/images/itau2.jpeg',
    'assets/images/itau1.png',
    'assets/images/itau3.jpg',
    'assets/images/itau4.jpg',
  ];
  void responder() {setState(() {
    if(contador == (imgList.length)-1){
      contador = 0;
    }
    else{
      contador++;
    }
    print(contador);
    });
  }
  void naoResponder() {setState(() {
    if(contador == 0){
      contador = (imgList.length)-1;
    }
    else{
      contador--;
    }});
    
    print(contador);
  }
  void _abrirPagina(BuildContext context) {
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
  }
  @override
  
  final ButtonStyle flatButtonStyle2 = ElevatedButton.styleFrom(
    
    //backgroundColor: Color.fromARGB(221, 12, 200, 245),
    //fixedSize: Size(300, 36),
    minimumSize: Size(36, 36),
    //padding: EdgeInsets.symmetric(horizontal: 20.0),
    //padding: EdgeInsets.all(10.0),
    //shape: const RoundedRectangleBorder(
    //  borderRadius: BorderRadius.all(Radius.circular(40.0)),
   // ),
  );


  final ButtonStyle flatButtonStyle = ElevatedButton.styleFrom(
    
    backgroundColor: Color.fromARGB(221, 12, 200, 245),
    //fixedSize: Size(300, 36),
    minimumSize: Size(300, 36),
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    //padding: EdgeInsets.all(10.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(40.0)),
    ),
  );
	Widget build(BuildContext context){
    
		return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 88, 161, 158)),
			home: Scaffold(
        appBar: AppBar(
          title: Text('Loyalty Cards'),
          backgroundColor: Color.fromARGB(221, 12, 200, 245),

        ),
        body: 
          
          Container( 
            width: double.infinity, margin: EdgeInsets.all(20.0),
            child: Column( 
            
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
              children: <Widget>[
                
                  Container(
                    width: double.infinity, margin: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        TextButton.icon(
                    
                          style: flatButtonStyle2,
                          onPressed: naoResponder,
                          icon: Icon(
                            Icons.navigate_before,
                            size: 36.0,
                            color: Color.fromARGB(221, 255, 255, 255),
                          ),
                          label: Text(''),
                  
                        ),
                        Image.asset( 
                          imgList[contador] ,height: 200,
                          width: 200,
                          fit: BoxFit.fitWidth,
                        ),
                        TextButton.icon(
                    
                          style: flatButtonStyle2,
                          onPressed: responder,
                          icon: Icon(
                            Icons.navigate_next,
                            size: 36.0,
                            color: Color.fromARGB(221, 255, 255, 255),
                          ),
                          label: Text(''), 
                  
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(3.0),
                    child: RatingBar.builder(
                            initialRating: 3.5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                  ),
                  
                  ElevatedButton(
                    
                    style: flatButtonStyle,
                    onPressed: () { //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
                      showDialog(
                          context: context, builder: 
                            (context) => NewScreen());
                    },
                    child: Text('Reclamações',  style: TextStyle(color: Colors.white, fontSize: 20)), 
            
                  ),
              
                ElevatedButton(
                  style: flatButtonStyle,
                  onPressed: (){
                    showDialog(
                          context: context, builder: 
                            (context) => ListaBeneficios());
                  },
                  child: Text('Beneficios Carteira',  style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                
                ElevatedButton(
                  style: flatButtonStyle,
                  onPressed: (){
                    showDialog(
                          context: context, builder: 
                            (context) => ListaBeneficios());
                  },
                  child: Text('Lista de Beneficios',  style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                
                ElevatedButton(
                  style: flatButtonStyle,
                  onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return QRImage(controller);
                    }),
                  ),
                );
              },
                  child: Text('Mostrar QRcode',  style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
            
            ],
            ),
          ),
        ),
		);
	
	}
}
  
class cardExpandido extends StatefulWidget {
	imgMuda createState(){
    return imgMuda();
  }
}
