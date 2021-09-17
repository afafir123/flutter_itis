import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Widget> _messages = [];
  TextEditingController _textEditingController = TextEditingController();

  void _addToList(BuildContext context, String message) {
    setState(() {
      if (message.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Message should not be empty'),
            action: SnackBarAction(
                label: 'Close',
                textColor: Colors.yellow,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                })));
      } else {
        _messages.add(Text(message));
      }
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
                child: _messages.isEmpty? const Center(child: Text('Start messaging...')): ListView.separated(
                    padding: const EdgeInsets.all(4),
                    itemCount: _messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          border: Border.all( color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 50,
                        child: _messages[index],
                      );
                    },
                  separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Theme.of(context).primaryColor,
                      );
                  },),

              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                    ),
                  ),
                  GestureDetector(
                    child: Icon(Icons.add),
                    onTap: () {
                      _addToList(context, _textEditingController.text);
                    },
                  )
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
