import 'dart:convert';
import 'dart:typed_data';

class PrivateKey {
  PrivateKey(String privateKey) :
    this._privateKey = privateKey;

  String _privateKey;

  String get privateKey => this._privateKey;

  factory PrivateKey.fromJson(Uint8List file) {
    String encodedFile = String.fromCharCodes(file);
    Map<String, dynamic> decodedFile = json.decode(encodedFile);

    return PrivateKey(decodedFile["private_key"]);
  }


}