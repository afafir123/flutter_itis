import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:homework/hw2/chat_message.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://itis-chat-app-ex.herokuapp.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/chat")
  Future<List<ChatMessage>> getChat();

  @POST("/chat")
  Future<ChatMessage> sendMessage(@Body() ChatMessage chat);
}