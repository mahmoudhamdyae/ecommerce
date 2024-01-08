class Profile {
  String? name;
  String? email;
  String? phone;

  Profile(this.name, this.email, this.phone);

  Profile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
}