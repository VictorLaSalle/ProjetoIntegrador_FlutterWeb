class UserLoginModel {

  int? _statusCode;
  String? _token;

  get statusCode => this._statusCode;
  get token => this._token;

  UserLoginModel(String token, int status) :
    this._token = token,
    this._statusCode = status;

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {

    String token = json['token'];
    int status = json['status'];

    return UserLoginModel(token, status);
  }

  static toJson(String email, String password) {
    Map<String, dynamic> map = Map();

    map['email'] = email;
    map['password'] = password;

    return map;
  }
  
}