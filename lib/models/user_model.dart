class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  String? coverImage;
  String? bio;
  bool? isEmailVerified;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.image,
    this.coverImage,
    this.bio,
    this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    coverImage = json['coverImage'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'coverImage': coverImage,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
