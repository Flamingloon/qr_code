import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_code/scanner.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var user;


  Future<UserCredential> signInWithGoogle() async {
    await Firebase.initializeApp();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    user = googleUser;

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);



  @override
  Widget build(BuildContext context) {
    // GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
            child: user!=null? Text("Scan"): Text("Login") ,
            onPressed: () async {
              // await signInWithGoogle();
              setState(() {




              });




              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanner()),
              );
            }),
      ),
    );
  }
}
