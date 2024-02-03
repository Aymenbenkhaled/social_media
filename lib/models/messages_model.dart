class MessagesModel {
  String? senderId;
  String? recieverId;
  String? text;
  String? dateTime;

  MessagesModel({
    this.senderId,
    this.recieverId,
    this.text,
    this.dateTime,
  });

  MessagesModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    recieverId = json['recieverId'];

    text = json['text'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'recieverId': recieverId,
      'text': text,
      'dateTime': dateTime,
    };
  }
}
