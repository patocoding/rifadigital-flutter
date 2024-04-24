import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  String? token;

  @action
  void setUsername(String value) => username = value;

  @action
  void setPassword(String value) => password = value;

  @action
  Future<void> login() async {
    isLoading = true;
    errorMessage = null;
    try {
      Modular.to.navigate('/home');
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/login'), // Substitua com a URL correta
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
        
      );
      print('chegou aqui');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('aqui');
        token = data['token']; // Armazena o token JWT para sessões futuras
        Modular.to.navigate('/home'); // Navega para a página inicial após login bem-sucedido
      } else {
        errorMessage = 'Falha no login: ${response.body}';
      }
    } catch (e) {
      print('Erro ao conectar ao servidor: $e') ;
      print('oi');
    } finally {
      isLoading = false;
      print('finally');
    }
  }
}