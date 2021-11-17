import '../../constants.dart';

class Respostas {
  Respostas(
      this._resposta1,
      this._resposta2,
      this._resposta3,
      this._resposta4,
      this._resposta5,
      this._resposta6,
      this._resposta7,
      this._resposta8,
      this._resposta9);

  Map<String, dynamic> _resposta1;
  Map<String, dynamic> _resposta2;
  Map<String, dynamic> _resposta3;
  Map<String, dynamic> _resposta4;
  Map<String, dynamic> _resposta5;
  Map<String, dynamic> _resposta6;
  Map<String, dynamic> _resposta7;
  Map<String, dynamic> _resposta8;
  Map<String, dynamic> _resposta9;

  factory Respostas.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> _resposta1 = json['respostas1Formatadas'][pergunta1];
    Map<String, dynamic> _resposta2 = json['respostas2Formatadas'][pergunta2];
    Map<String, dynamic> _resposta3 = json['respostas3Formatadas'][pergunta3];
    Map<String, dynamic> _resposta4 = json['respostas4Formatadas'][pergunta4];
    Map<String, dynamic> _resposta5 = json['respostas5Formatadas'][pergunta5];
    Map<String, dynamic> _resposta6 = json['respostas6Formatadas'][pergunta6];
    Map<String, dynamic> _resposta7 = json['respostas7Formatadas'][pergunta7];
    Map<String, dynamic> _resposta8 = json['respostas8Formatadas'][pergunta8];
    Map<String, dynamic> _resposta9 = json['respostas9Formatadas'][pergunta9];

    return Respostas(_resposta1, _resposta2, _resposta3, _resposta4, _resposta5,
        _resposta6, _resposta7, _resposta8, _resposta9);
  }

  Map<String, dynamic> get resposta1 => _resposta1;

  Map<String, dynamic> get resposta2 => _resposta2;

  Map<String, dynamic> get resposta3 => _resposta3;

  Map<String, dynamic> get resposta4 => _resposta4;

  Map<String, dynamic> get resposta5 => _resposta5;

  Map<String, dynamic> get resposta6 => _resposta6;

  Map<String, dynamic> get resposta7 => _resposta7;

  Map<String, dynamic> get resposta8 => _resposta8;

  Map<String, dynamic> get resposta9 => _resposta9;
}
