class UserModel {
  String id;
  String email;
  String firstName;
  String secondName;
  String phoneNumber;
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.secondName,
    required this.phoneNumber,
  });
  factory UserModel.fromJson(
    Map<String, dynamic> json,){
      return UserModel(
        firstName: json["firstName"],
        secondName: json["secondName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        id: json["id"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "secondName": secondName,
      "email": email,
      "phoneNumber": phoneNumber,
      "id": id,
    };
  }
}
