import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../settings/settings.dart';

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
  bool hidePassword = true;

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
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            // bottom: 50,
            top: 150,
            right: 20,
          ),
          child: Center(
            child: Column(
              children: [
                // SizedBox(
                //   height: 30,
                // ),
                TextFormField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                    hintText: 'メールアドレス',
                    fillColor: Colors.blueGrey.withOpacity(0.1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _controllerPassword,
                  decoration: InputDecoration(
                    hintText: 'パスワード',
                    fillColor: Colors.blueGrey.withOpacity(0.1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(hidePassword ? Icons.lock : Icons.lock_open),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: hidePassword,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.redAccent),
                ),
                CustomButton(
                  function: () {
                    login ? signInUser() : createUser();
                  },
                  text: login ? 'ログイン' : '新規登録',
                  fontSize: 20,
                ),
                Container(
                  height: 40,
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
                    login ? '新規登録する' : 'メールアドレスでログインする',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  child: Center(
                      child: Text(
                    'または',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
                ),
                CustomButton(
                  function: () {
                    loginAno();
                  },
                  text: '匿名でログイン',
                  fontSize: 16,
                  color: Colors.lightGreen[200],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
