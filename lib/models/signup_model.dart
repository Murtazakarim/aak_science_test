class SignupModel {
  String? status;
  int? userId;
  String? userType;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? country;
  String? userActiveStatus;
  String? message;
  String? password;

  SignupModel(
      {this.status,
        this.userId,
        this.userType,
        this.firstName,
        this.lastName,
        this.username,
        this.email,
        this.country,
        this.userActiveStatus,
        this.message, this.password});

  SignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    country = json['country'];
    userActiveStatus = json['user_active_status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['user_id'] = userId;
    data['user_type'] = userType;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['country'] = country;
    data['password'] = password;
    data['user_active_status'] = userActiveStatus;
    data['message'] = message;
    return data;
  }
}