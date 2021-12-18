import 'package:homework/hw2/chat_message_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'chat_list.dart';

class Homework2 extends StatefulWidget {
  const Homework2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _Homework2State createState() => _Homework2State();

}

class _Homework2State extends State<Homework2> {
  ChatMessageStore _chatMessageStore = ChatMessageStore();

  final messageController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _chatMessageStore.getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(child: Observer(
              builder: (context) {
                return ListView.builder(
                  itemCount: _chatMessageStore.messages.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) {
                    return ChatList(
                      name: _chatMessageStore.messages[index].author,
                      message: _chatMessageStore.messages[index].message,
                      isMe: _chatMessageStore.messages[index].author == "Bulat"
                    );
                  },
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: messageController,
                onChanged: (value) {},
                decoration: InputDecoration(
                    labelText: "Наберите сообщение",
                    hintText: "...",
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: _addMessage,
                    ),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addMessage() {
    setState(() {
      _chatMessageStore.sendMessage(messageController.text, "Bulat",
          onSend: () => {messageController.clear()});
    });
  }
}
