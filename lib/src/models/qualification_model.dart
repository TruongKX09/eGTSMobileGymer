class Qualifications {
  String? expertId;
  String? certificate;
  String? descrition;
  int? experience;
  bool? isCetifide;
  bool? isDelete;

  Qualifications(
      {this.expertId,
      this.certificate,
      this.descrition,
      this.experience,
      this.isCetifide,
      this.isDelete});

  Qualifications.fromJson(Map<String, dynamic> json) {
    expertId = json['expertId'];
    certificate = json['certificate'];
    descrition = json['descrition'];
    experience = json['experience'];
    isCetifide = json['isCetifide'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expertId'] = expertId;
    data['certificate'] = certificate;
    data['descrition'] = descrition;
    data['experience'] = experience;
    data['isCetifide'] = isCetifide;
    data['isDelete'] = isDelete;

    return data;
  }
}
