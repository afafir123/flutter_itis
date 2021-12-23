import 'package:dio/dio.dart';
import 'package:redux/redux.dart';

import 'api_client.dart';
import 'chat_message.dart';
import 'chat_state.dart';

class SetChatStateAction {
  final ChatState chatState;

  SetChatStateAction(this.chatState);
}

Future<void> fetchPostsAction(Store store) async {
  RestClient restClient = RestClient(Dio());
  restClient.getChat().then((List<ChatMessage> messages) {
    SetChatStateAction(
      ChatState(
        chatMessages: messages,
      ),
    );
  }).catchError((error) {
    print(error.toString());
  });
}