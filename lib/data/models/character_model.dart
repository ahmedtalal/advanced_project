class CharacterModel {
  late int charId;
  late String name;
  late String nickName;
  late String birthDay;
  late String image;
  late String status;
  late String portrayed;
  late List<dynamic> jobs;
  late List<dynamic> appearance;
  late List<dynamic> betterCallSaulAppearance;
  CharacterModel({
    required this.charId,
    required this.name,
    required this.nickName,
    required this.birthDay,
    required this.image,
    required this.status,
    required this.portrayed,
    required this.jobs,
    required this.appearance,
    required this.betterCallSaulAppearance,
  });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    this.charId = json['char_id'];
    this.name = json['name'];
    this.nickName = json['nickname'];
    this.birthDay = json['birthday'];
    this.image = json['img'];
    this.status = json['status'];
    this.portrayed = json['portrayed'];
    this.jobs = json['occupation'];
    this.appearance = json['appearance'];
    this.appearance = json['better_call_saul_appearance'];
  }

  static Map<String, dynamic> toJson(CharacterModel model) => {
        "char_id": model.charId,
        "name": model.name,
        "nickname": model.nickName,
        "birthday": model.birthDay,
        "img": model.image,
        "status": model.status,
        "portrayed": model.portrayed,
        "occupation": model.jobs,
        "appearance": model.appearance,
        "better_call_saul_appearance": model.betterCallSaulAppearance,
      };
}
