class UpdateDetail {
  String? name;
  String? job;

  UpdateDetail({this.name, this.job});

  UpdateDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    return data;
  }
}
