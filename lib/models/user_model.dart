class User {

  late String name;
  late String email;
  late String phone;
  late String password;
  late String cpassword;

  User({required this.name,required this.email,required this.phone,required this.password,required this.cpassword});
  User.from({required this.email,required this.password});
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'],
        cpassword = json['cpassword'];
  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'password': password,
      };
}