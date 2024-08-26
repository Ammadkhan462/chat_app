class CallType {
  String? id;
  String? callerName;
  String? callerpic;
  String? calleruid;
  String? callerEmail;
  String? recieverName;
  String? recieverpic;
  String? recieveruid;
  String? recieverEmail;
  String? status;
  String? type;

  CallType(
      {this.id,
      this.callerName,
      this.callerpic,
      this.calleruid,
      this.callerEmail,
      this.recieverName,
      this.recieverpic,
      this.recieveruid,
      this.recieverEmail,
      this.status,
      this.type
      });

  CallType.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["callerName"] is String) {
      callerName = json["callerName"];
    }
    if (json["callerpic"] is String) {
      callerpic = json["callerpic"];
    }
    if (json["calleruid"] is String) {
      calleruid = json["calleruid"];
    }
    if (json["callerEmail"] is String) {
      callerEmail = json["callerEmail"];
    }
    if (json["recieverName"] is String) {
      recieverName = json["recieverName"];
    }
    if (json["recieverpic"] is String) {
      recieverpic = json["recieverpic"];
    }
    if (json["recieveruid"] is String) {
      recieveruid = json["recieveruid"];
    }
    if (json["recieverEmail"] is String) {
      recieverEmail = json["recieverEmail"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["callerName"] = callerName;
    _data["callerpic"] = callerpic;
    _data["calleruid"] = calleruid;
    _data["callerEmail"] = callerEmail;
    _data["recieverName"] = recieverName;
    _data["recieverpic"] = recieverpic;
    _data["recieveruid"] = recieveruid;
    _data["recieverEmail"] = recieverEmail;
    _data["status"] = status;
    _data["type"] = type;
    return _data;
  }
}
