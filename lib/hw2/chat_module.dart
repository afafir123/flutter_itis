import 'package:flutter_modular/flutter_modular.dart';
import 'package:homework/hw2/chat_message_store.dart';
import '../main.dart';

class ChatModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => ChatMessageStore())];

  @override
  List<ModularRoute> get routes => [ModuleRoute('/', module: ChatModule())];
}