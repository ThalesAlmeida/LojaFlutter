import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
          key: _formkey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Nome Completo"
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  if(text.isEmpty){
                    return "Digite um nome";
                  }
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "E-mail"
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text){
                  if(text.isEmpty || !text.contains("@")){
                    return "Email inválido";
                  }
                },
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                  decoration: InputDecoration(
                      hintText: "Senha"
                  ),
                  obscureText: true,
                  validator: (text){
                    if(text.isEmpty){
                      return "Digite uma senha";
                    }
                  }
              ),
              SizedBox(height: 16.0,),
              TextFormField(
                  decoration: InputDecoration(
                      hintText: "Endereço"
                  ),
                  validator: (text){
                    if(text.isEmpty){
                      return "Adicione um endereço";
                    }
                  }
              ),

              SizedBox(height: 16.0,),
              SizedBox(
                height: 44.0,
                child: RaisedButton(
                  child: Text("Criar",
                    style: TextStyle(
                        fontSize: 18.0),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    if(_formkey.currentState.validate()){
                    }
                  },
                ),
              )
            ],
          )
      ),
    );
  }
}
