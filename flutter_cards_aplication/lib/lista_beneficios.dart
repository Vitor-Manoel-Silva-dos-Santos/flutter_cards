import 'dart:ffi';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
var x = 50.0;
var primeirobene = (((x + 50.0)/100.0)>1.0) ? 1.0 : (x + 50.0)/100.0; 
var segundobene = (((x + 25.0)/100.0)>1.0) ? 1.0: ((x + 25.0)/100.0);
var terceirobene = ((x/100.0)>1.0) ? 1.0 : (x/100.0);
resgatarBeneficio(){
  primeirobene = (primeirobene>1.0) ? 1.0 : primeirobene; 
  segundobene = (segundobene>1.0) ? 1.0: segundobene;
  terceirobene = (terceirobene>1.0) ? 1.0 : terceirobene;
  return (primeirobene >= 1.0)||(segundobene >= 1.0)||(terceirobene >= 1.0) ? true : false;
}
class ListaBeneficios extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 88, 161, 158),
        appBar: new AppBar(
          title: new Text("Lista de beneficios"),
          backgroundColor: Color.fromARGB(221, 12, 200, 245),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TextFormField(decoration: InputDecoration(hintText:'texto',)),
              
              /*Container( width: double.infinity, margin: EdgeInsets.all(15.0),
                child: const Text(
                '50 % off',
                style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              
              ),*/
              
              Padding(
                
                padding: EdgeInsets.all(15.0),
                
                child: new LinearPercentIndicator(
                  backgroundColor: Color.fromARGB(221, 12, 200, 245),
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 30.0,
                  animationDuration: 2500,
                  percent: primeirobene,
                  center: Text("50 % off", style: TextStyle(color: Colors.white)),
                  barRadius: const Radius.circular(16),
                  progressColor: Color.fromARGB(221, 23, 0, 87),
                  
                ),
              ),
              Container( width: double.infinity, margin: EdgeInsets.all(10.0), alignment: Alignment.topLeft,
                child: const Text(
                'Abastecer o carro 10 vezes.',
                style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  backgroundColor: Color.fromARGB(221, 12, 200, 245),
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 30.0,
                  animationDuration: 2500,
                  percent: segundobene,
                  center: Text("75 % off", style: TextStyle(color: Colors.white)),
                  barRadius: const Radius.circular(16),
                  progressColor: Color.fromARGB(221, 23, 0, 87),
                ),
              ),
              Container( width: double.infinity, margin: EdgeInsets.all(10.0), alignment: Alignment.topLeft,
                child: const Text(
                'Abastecer o carro 15 vezes.',
                style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  backgroundColor: Color.fromARGB(221, 12, 200, 245),
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 30.0,
                  animationDuration: 2500,
                  percent: terceirobene,
                  center: Text("100 % off", style: TextStyle(color: Colors.white)),
                  barRadius: const Radius.circular(16),
                  progressColor: Color.fromARGB(221, 23, 0, 87),
                ),
              ),
              Container( width: double.infinity, margin: EdgeInsets.all(10.0), alignment: Alignment.topLeft,
                child: const Text(
                'Abastecer o carro 20 vezes.',
                style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              
              ),

              
            ],
          ),
        ),
      );
    }
}