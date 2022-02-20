class ApiCallResults {
  ApiCallResults({
    required this.url,
  });
  late final String url;

  ApiCallResults.fromJson(Map<String, dynamic> json){
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    return _data;
  }
}