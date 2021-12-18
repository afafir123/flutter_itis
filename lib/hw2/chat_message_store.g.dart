// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatMessageStore on _ChatMessageStore, Store {
  final _$messagesAtom = Atom(name: '_ChatMessageStore.messages');

  @override
  ObservableList<ChatMessage> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<ChatMessage> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$_ChatMessageStoreActionController =
      ActionController(name: '_ChatMessageStore');

  @override
  void getMessages() {
    final _$actionInfo = _$_ChatMessageStoreActionController.startAction(
        name: '_ChatMessageStore.getMessages');
    try {
      return super.getMessages();
    } finally {
      _$_ChatMessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendMessage(String textMessage, String author, {Function? onSend}) {
    final _$actionInfo = _$_ChatMessageStoreActionController.startAction(
        name: '_ChatMessageStore.sendMessage');
    try {
      return super.sendMessage(textMessage, author, onSend: onSend);
    } finally {
      _$_ChatMessageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages}
    ''';
  }
}
