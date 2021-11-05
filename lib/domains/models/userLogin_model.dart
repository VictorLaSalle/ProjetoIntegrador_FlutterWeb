class UserLoginModel {

  int? _statusCode;
  String? _token;

  get statusCode => this._statusCode;
  get token => this._token;

  UserLoginModel(int statusCode, String token);

  factory UserLoginModel.fromJson(Map<String, dynamic> json, int status) {

    int statusCode = status;
    String token = json['token'];

    UserLoginModel model = UserLoginModel(statusCode, token);

    return model;
  }

  static toJson(String email, String password) {
    Map<String, dynamic> map = Map();

    map['email'] = email;
    map['password'] = password;

    return map;
  }
  
}