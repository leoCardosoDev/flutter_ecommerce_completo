import 'package:ecommerce_completo/helpers/validators.dart';
import 'package:ecommerce_completo/models/user/user.dart';
import 'package:ecommerce_completo/models/user/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          child: Form(
            key: _formKey,
            child: Consumer<UserManager>(builder: (_, userManager, __) {
              return ListView(
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: _emailController,
                    enabled: !userManager.loading,
                    decoration: InputDecoration(hintText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    validator: (email) {
                      if (!emailValid(email)) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _passwordController,
                    enabled: !userManager.loading,
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
                      onPressed: userManager.loading ? null : () {},
                      child: Text('Esqueci minha senha'),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 45,
                    child: RaisedButton(
                      disabledColor:
                          Theme.of(context).primaryColor.withAlpha(100),
                      onPressed: userManager.loading
                          ? null
                          : () {
                              if (_formKey.currentState.validate()) {
                                userManager.signIn(
                                  user: User(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                  onFail: (error) {
                                    _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content: Text('Error: $error'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  },
                                  onSuccess: () {},
                                );
                              }
                            },
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: userManager.loading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text('Entrar'),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
