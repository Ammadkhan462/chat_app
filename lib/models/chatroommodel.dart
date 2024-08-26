
import 'package:chat_app/models/chatmode.dart';
import 'package:chat_app/models/usermodel.dart';

class ChatRoomModel {
  String? id;
  UserModel? sender;
  UserModel? reciever;
  List<ChatModel>? messages;
  int? unReadMessageno;
  String? lastmessage;
  String? lastmessagetimestamp;
  String? timestamp;

  ChatRoomModel({this.id, this.sender, this.reciever, this.messages, this.unReadMessageno, this.lastmessage, this.lastmessagetimestamp, this.timestamp});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["sender"] is Map) {
      sender = json["sender"] == null ? null : UserModel.fromJson(json["sender"]);
    }
    if(json["reciever"] is Map) {
      reciever = json["reciever"] == null ? null : UserModel.fromJson(json["reciever"]);
    }
    if(json["messages"] is List) {
      messages = json["messages"] ?? [];
    }
    if(json["unReadMessageno"] is int) {
      unReadMessageno = json["unReadMessageno"];
    }
    if(json["lastmessage"] is String) {
      lastmessage = json["lastmessage"];
    }
    if(json["lastmessagetimestamp"] is String) {
      lastmessagetimestamp = json["lastmessagetimestamp"];
    }
    if(json["timestamp"] is String) {
      timestamp = json["timestamp"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if(sender != null) {
      _data["sender"] = sender?.toJson();
    }
    if(reciever != null) {
      _data["reciever"] = reciever?.toJson();
    }
    if(messages != null) {
      _data["messages"] = messages;
    }
    _data["unReadMessageno"] = unReadMessageno;
    _data["lastmessage"] = lastmessage;
    _data["lastmessagetimestamp"] = lastmessagetimestamp;
    _data["timestamp"] = timestamp;
    return _data;
  }



}