class MessageModel {
  final String message;
  final String sender;
  final String receiver;
  final String date;
  MessageModel(
      {required this.message,
      required this.sender,
      required this.date,
      required this.receiver});

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(
      message: jsonData['message'],
      sender: jsonData['sender'],
      date: jsonData['date'],
      receiver: jsonData['receiver'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sender': sender,
      'date': date,
      'receiver': receiver
    };
  }
}
