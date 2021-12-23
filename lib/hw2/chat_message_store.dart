import 'package:dio/dio.dart';
import 'package:homework/hw1/chat.dart';
import 'package:mobx/mobx.dart';
import 'api_client.dart';
import 'chat_message.dart';

part 'chat_message_store.g.dart';

class ChatMessageStore = _ChatMessageStore with _$ChatMessageStore;

abstract class _ChatMessageStore with Store {

  RestClient rest = RestClient(Dio());

  @observable
  ObservableList<ChatMessage> messages = ObservableList.of([]);

  @action
  void getMessages() {
    rest.getChat().then((List<ChatMessage> messages) {
      this.messages = ObservableList.of(messages);
    }).catchError((onError) {
      print(onError.toString());
    });
  }

    @action
    void sendMessage(String textMessage, String author, {Function? onSend}) {
      ChatMessage message = ChatMessage(author: author, message: textMessage);

      rest.sendMessage(message).then((ChatMessage message) {
        messages.add(message);

        if (onSend != null) {
          onSend();
        }
      }).catchError((error) {
        print(error.toString());
      });
    }
  }
