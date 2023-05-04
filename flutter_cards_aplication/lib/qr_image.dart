import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'lista_beneficios.dart';


TextEditingController controller = TextEditingController();

class QRImage extends StatelessWidget {
  const QRImage(this.controller, {super.key});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Color.fromARGB(255, 88, 161, 158),
        appBar: AppBar(
        
          title: const Text('Loyalty Cards QR code'),
          //centerTitle: true,
          backgroundColor: Color.fromARGB(221, 12, 200, 245),
        ),
        body: Center(
          child: 
          showwidget()
          /*QrImage(
            data: controller.text,
            size: 280,
            
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: const Size(
                100,
                100,
              ),
            ),
          ),*/
        ),
     );
   }
   
   showwidget(){
     if(resgatarBeneficio()){
        return QrImage(
            data: controller.text,
            size: 280,
            
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: const Size(
                100,
                100,
              ),
            ),
          );
     }else{
        return Text("Nenhum beneficio disponivel");
     }
   }
   
}
