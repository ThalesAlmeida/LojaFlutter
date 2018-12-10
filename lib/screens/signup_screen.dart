import 'package:flutter/material.dart';
import 'package:loja_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _enderecoController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Criar Conta"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              if(model.isLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              return Form(
                  key: _formkey,
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
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
                        controller: _emailController,
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
                          controller: _passController,
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
                          controller: _enderecoController,
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

                              Map<String, dynamic> userData = {
                                "name": _nameController.text,
                                "email": _emailController.text,
                                "endereco": _enderecoController.text,
                              };

                              model.signUp(
                                  userData: userData,
                                  pass: _passController.text,
                                  onSuccess: _onSuccess,
                                  onFail: _onFail
                              );
                            }
                          },
                        ),
                      )
                    ],
                  )
              );
            }
        )
    );
  }

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Usuário criado com sucesso"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 2),
      )
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Usuário não criado"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        )
    );
  }
}

