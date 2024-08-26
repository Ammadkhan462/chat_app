
class ChatModel {
  String? id;
  String? message;
  String? senderName;
  String? senderId;
  String? receiverId;
  String? timeStamp;
  String? readStatus;
  String? imageUrl;
  String? videoUrl;
  String? audioUrl;
  String? dcumaentUrl;
  List<String>? reactions;
  List<dynamic>? replies;

  ChatModel({this.id, this.message, this.senderName, this.senderId, this.receiverId, this.timeStamp, this.readStatus, this.imageUrl, this.videoUrl, this.audioUrl, this.dcumaentUrl, this.reactions, this.replies});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["SenderName"] is String) {
      senderName = json["SenderName"];
    }
    if(json["SenderId"] is String) {
      senderId = json["SenderId"];
    }
    if(json["receiverId"] is String) {
      receiverId = json["receiverId"];
    }
    if(json["timeStamp"] is String) {
      timeStamp = json["timeStamp"];
    }
    if(json["readStatus"] is String) {
      readStatus = json["readStatus"];
    }
    if(json["ImageUrl"] is String) {
      imageUrl = json["ImageUrl"];
    }
    if(json["videoUrl"] is String) {
      videoUrl = json["videoUrl"];
    }
    if(json["audioUrl"] is String) {
      audioUrl = json["audioUrl"];
    }
    if(json["dcumaentUrl"] is String) {
      dcumaentUrl = json["dcumaentUrl"];
    }
    if(json["reactions"] is List) {
      reactions = json["reactions"] == null ? null : List<String>.from(json["reactions"]);
    }
    if(json["replies"] is List) {
      replies = json["replies"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["message"] = message;
    _data["SenderName"] = senderName;
    _data["SenderId"] = senderId;
    _data["receiverId"] = receiverId;
    _data["timeStamp"] = timeStamp;
    _data["readStatus"] = readStatus;
    _data["ImageUrl"] = imageUrl;
    _data["videoUrl"] = videoUrl;
    _data["audioUrl"] = audioUrl;
    _data["dcumaentUrl"] = dcumaentUrl;
    if(reactions != null) {
      _data["reactions"] = reactions;
    }
    if(replies != null) {
      _data["replies"] = replies;
    }
    return _data;
  }
}