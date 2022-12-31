class Rating {
  Rating({
      this.rate, 
      this.count,});

  Rating.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }
  dynamic? rate;
  dynamic? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = 1.0;
    map['count'] = 1;
    return map;
  }

}