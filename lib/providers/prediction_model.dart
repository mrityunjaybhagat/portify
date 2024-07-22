class Prediction {
  String placeId;
  String mainTxt;
  String secondaryText;
  Prediction({
    required this.placeId,
    required this.mainTxt,
    required this.secondaryText,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      //id: json['id'] as int, // Ensure id is parsed as int
      placeId: json['place_id'] as String,
      mainTxt: json['structured_formatting']['main_text'] as String,
      secondaryText: json['structured_formatting']['secondaryText'] as String,
    );
  }
}
