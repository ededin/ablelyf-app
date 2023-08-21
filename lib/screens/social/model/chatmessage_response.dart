
import '../../../ablelyf.dart';

ChatMessage chatMessageFromJson(String str) =>
    ChatMessage.fromJson(json.decode(str));

String chatMessageToJson(ChatMessage data) => json.encode(data.toJson());

class ChatMessage {
  final String? senderId;
  final bool? read;
  final String? chatId;
  final String? time;
  final String? id;
  final String? media;
  final int? type;
  String? message;
  final String? latitude;
  final String? longitude;
  List? deleted;

  ChatMessage({
     this.senderId,
     this.read,
     this.chatId,
     this.time,
     this.id,
     this.media,
     this.type,
     this.message,
     this.latitude,
     this.longitude,
     this.deleted,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      senderId: json["senderId"],
      read: json["read"],
      chatId: json["chatId"],
      time: json["time"],
      id: json["id"],
      media: json["media"] ?? '',
      type: json["type"],
      message: json["message"] ?? '',
      latitude: json["latitude"],
      longitude: json["longitude"],
      deleted: json["deleted"] ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
        "senderId": senderId,
        "read": read,
        "chatId": chatId,
        "time": time,
        "id": id,
        "media": media,
        "type": type,
        "message": message,
        "latitude": latitude,
        "longitude": longitude,
        "deleted": deleted,
      };
}
