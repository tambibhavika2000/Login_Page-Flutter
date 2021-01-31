import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController=new AnimationController(vsync: this,duration: new Duration(microseconds: 500));
    _iconAnimation= new CurvedAnimation(
      parent: _iconAnimationController,curve: Curves.easeOut);
    _iconAnimation.addListener(()=>this.setState(() {}));
    _iconAnimationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: new AssetImage("assets/front.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value*100,
              ),
              Form(child: Theme(
               data: ThemeData(
                 brightness: Brightness.dark,primarySwatch: Colors.blue,
                 inputDecorationTheme: new InputDecorationTheme(
                   labelStyle: TextStyle(
                     color: Colors.teal,
                     fontSize: 20.0
                   )
                 )
               ),
                child: Container(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      Padding(padding: EdgeInsets.only(top:25.0)),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(padding: EdgeInsets.only(top:40.0)),
                      MaterialButton(
                        height: 50.0,
                        minWidth: 100.0,
                        color:Colors.teal,
                        textColor: Colors.white,
                        child: Icon(Icons.double_arrow_outlined),
                        onPressed: ()=>{},
                        splashColor: Colors.blue,
                      )
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}


