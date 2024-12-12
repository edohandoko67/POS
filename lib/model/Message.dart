class Message {
  int? idPesan;
  String? judulText;
  String? text;

  Message({
    this.idPesan,
    this.judulText,
    this.text
  });
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        idPesan: json["idPesan"] ?? 0,
        judulText: json["title"] ?? '',
        text: json["message"] ?? ''
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "idPesan": idPesan,
      "title": judulText,
      "message": text
    };
  }
}