import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color.fromARGB(255, 88, 161, 158),
      
      appBar: AppBar(
        
        title: const Text('Reclamações'),
        backgroundColor: Color.fromARGB(221, 12, 200, 245),
      ),
      body:
      
      Container(
        
        child: Container(alignment: Alignment.center, margin: EdgeInsets.all(20.0),
        child: Align(
            alignment: FractionalOffset.bottomCenter,
          
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(221, 12, 200, 245),
              //fixedSize: Size(300, 36),
              minimumSize: Size(300, 36),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              //padding: EdgeInsets.all(10.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ),
            ),
            child: const Text('Adicionar Reclamação'),
            
            onPressed: () { //Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewScreen()));
              showDialog(
                  context: context, builder: 
                    (context) => FeedbackDialog());
            },
          ),
        ),
        ),
        
      ),
    );
  }
}

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        
        key: _formKey,
        
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Adicione sua reclamação aqui',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 4096,
          //textInputAction: TextInputAction.done,
          validator: (String ? text) {
            if (text == null || text.isEmpty) {
              print(_controller.text);
              return 'Please enter a value';
              
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('Send'),
          onPressed: () => Navigator.pop(context), // sem função
        )
      ],
    );
  }
}

