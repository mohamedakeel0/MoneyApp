class Prediction {
  String? prediction;

  Prediction({this.prediction});

  Prediction.fromJson(Map<String, dynamic> json) {
    prediction = json['Prediction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Prediction'] = this.prediction;
    return data;
  }
}