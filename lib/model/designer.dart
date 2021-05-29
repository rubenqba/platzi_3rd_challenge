import 'dart:math';

class DesignerModel {
  final String avatar;
  final String name;
  final int experience;
  final String email;

  DesignerModel(this.avatar, this.name, this.experience, this.email);

  factory DesignerModel.fromJson(dynamic json) {
    return DesignerModel(
        _extractAvatar(json),
        _extractName(json),
        Random().nextInt(15),
        _extractEmail(json));
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$name ($email) with $experience years of experience";
  }
}

String _extractEmail(dynamic json) {
  return json["email"] as String;
}

String _extractName(dynamic json) {
  var firstName = json["name"]["first"] as String;
  var lastName = json["name"]["last"] as String;
  return "$firstName $lastName";
}

String _extractAvatar(dynamic json) {
  return json["picture"]["large"] as String;
}
