import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  final String name;
  final String message;
  final bool isMe;

  const ChatList(
      {Key? key, required this.name, required this.message, required this.isMe})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {       return Container(
    width: MediaQuery.of(context).size.width*.75,
    decoration: BoxDecoration(
        color: widget.isMe?Theme.of(context).accentColor:const Color(0XFFFFEFEE),
        borderRadius: widget.isMe? const BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)): const BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
    ),
    margin: widget.isMe?const EdgeInsets.only(top: 8.0,bottom: 8.0,left: 80):const EdgeInsets.only(top: 8.0,bottom: 8.0, right: 80),
    padding:  const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.name,style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 10),),
        const SizedBox(height: 10.0,),
        Text(widget.message,style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 12),),
      ],
    ),
  );
  }
}