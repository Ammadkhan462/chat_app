class UserModel {
  String? id;
  String? name;
  String? email;
  String? imageUrl;
  String? phoneNumber;
  String? about;
  String? createdAt;
  String? lastOnlineStatus;
  String? status;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.imageUrl,
    this.phoneNumber,
    this.about,
    this.createdAt,
    this.lastOnlineStatus,
    this.status,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"]; // Ensure this matches Firestore
    imageUrl = json["imageUrl"];
    phoneNumber = json["phoneNumber"];
    about = json["about"];
    createdAt = json["createdAt"];
    lastOnlineStatus = json["lastOnlineStatus"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email, // Ensure this matches Firestore
      "imageUrl": imageUrl,
      "phoneNumber": phoneNumber,
      "about": about,
      "createdAt": createdAt,
      "lastOnlineStatus": lastOnlineStatus,
      "status": status,
    };
  }
}
