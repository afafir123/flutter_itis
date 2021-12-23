import 'package:flutter/material.dart';
import 'package:homework/hw2/homework_2.dart';
import 'package:homework/hw3/homework_3.dart';

import 'hw1/chat.dart';

void main() {
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
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Homework navigator page'),
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
  List<String> _items = ['Chat','There should be second homework'];

  TextEditingController _textEditingController = TextEditingController();

  void _addToList(String text) {
    setState(() {
      _items.add(text);
    });
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        InkWell(

                      child:Container(
                          height: 50,
                          color: Colors.amber[600],
                          child: const Center(child: Text('Chat homework')
                          )
                        ),
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Chat(title: 'Chat')));
                      }),
                        InkWell(

                            child:Container(
                                height: 50,
                                color: Colors.amber[600],
                                child: const Center(child: Text('Api homework')
                                )
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Homework2(title: 'Api')));
                            }),
                        InkWell(

                            child:Container(
                                height: 50,
                                color: Colors.amber[600],
                                child: const Center(child: Text('Gallery')
                                )
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Homework3()));
                            })
                      ]
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

