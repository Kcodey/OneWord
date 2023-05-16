import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yiyan/ui/page/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  bool darkModeOn = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    // TODO: implement didChangePlatformBrightness
    super.didChangePlatformBrightness();
    Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
    setState(() {
      if (brightness.name == "light") {
        darkModeOn = false;
      } else {
        darkModeOn = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
     theme: ThemeData(fontFamily: 'MaShanZheng',brightness: !darkModeOn?Brightness.light:Brightness.dark),
     // darkTheme: ThemeData(fontFamily: 'MaShanZheng', brightness: Brightness.dark),
     home: Scaffold(
     body: Stack(
       children: [
         HomePage(),
         Positioned(
             right: 20,
             top: 20,
             child: SizedBox(
               width: 30,
               height: 30,
               child: MaterialButton(
                  padding: EdgeInsets.all(0),
                   onPressed: (){
                    setState(() {
                      darkModeOn = !darkModeOn;
                    });
                   },
                  child: Icon(
                    darkModeOn? Icons.dark_mode:Icons.dark_mode_outlined,
                    size: 25,
                  )),
             ))
       ],
     )
     ),
    );
  }
}
