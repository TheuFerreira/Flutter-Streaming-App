class UserInfoModel {
  late String name;

  UserInfoModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
  }

  @override
  String toString() {
    return "Name: $name";
  }
}
