import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final Function(User?) onSignIn;
  LoginPage({required this.onSignIn});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  String error = '';
  bool login = true;

  Future<void> loginAno() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    widget.onSignIn(userCredential.user);
  }

  Future<void> createUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _controllerEmail.text, password: _controllerPassword.text);
      print(userCredential.user);
      widget.onSignIn(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.message != null)
        setState(() {
          error = e.message!;
        });
      print(error);
    }
  }

  Future<void> signInUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _controllerEmail.text, password: _controllerPassword.text);
      print(userCredential.user);
      widget.onSignIn(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.message != null)
        setState(() {
          error = e.message!;
        });
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    labelText: 'メールアドレス',
                  ),
                ),
                TextFormField(
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    labelText: 'パスワード',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.redAccent),
                ),
                ElevatedButton(
                  onPressed: () {
                    login ? signInUser() : createUser();
                  },
                  child: Text(
                    login ? 'ログイン' : '新規登録',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  height: 70,
                  child: Center(
                      child: Text(
                    'または',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      login = !login;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.amber[50],
                      side: BorderSide(color: Colors.amber, width: 3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                  child: Text(
                    login ? '新規登録' : 'メールアドレスでログイン',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 70,
                  child: Center(
                      child: Text(
                    'または',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
                ),
                ElevatedButton(
                  onPressed: () {
                    loginAno();
                  },
                  child: Text(
                    '匿名でログイン',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreen[200],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
