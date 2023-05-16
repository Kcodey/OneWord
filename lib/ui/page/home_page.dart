import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widget/vertical_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String textContent = '';
  String from = '';
  
  void loadText()async{
    var url = Uri.parse("https://v1.hitokoto.cn?c=k");
    var response = await http.post(url);
    Map<String,dynamic> respData = json.decode(response.body);
    setState(() {
      textContent = respData["hitokoto"];
      from = respData["from_who"]??"佚名";
    });
  }

  Widget textWidget(){
    // return Text(textContent+from);
    return VerticalText(
      textContent: textContent,
      from: from,
      stringLength: 16,
      singleLineWidth:10
    );
  }

  
  Widget imageWidget() {
    return const CircleAvatar(
     backgroundColor: Colors.white70,
     foregroundImage: NetworkImage(
       'https://img.xjh.me/random_img.php?type=bg&ctype=nature&return=302'),
     radius: 90);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadText();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Center(
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[imageWidget(), textWidget()],
      ),
     ),
    );
  }
}

