import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email) {
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(hintText: 'Senha'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                obscureText: true,
                validator: (password) {
                  if (password.isEmpty || password.length < 6) {
                    return 'Senha inválida';
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text('Esqueci minha senha'),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 45,
                child: RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
