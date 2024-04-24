import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String name = '';

  @observable
  String lastname = '';

  @observable
  String username = '';

  @observable
  String phone = '';

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

    @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setName(String value) => name = value;

  @action
  void setLastName(String value) => lastname = value;

  @action
  void setUsername(String value) => username = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  Future<void> signup() async {
    isLoading = true;
    errorMessage = null;
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/register'),  // Substitua pela URL do seu endpoint
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'name': name,
          'lastname': lastname,
          'username': username,
          'phone': phone,
        }),
      );

      if (response.statusCode == 201) {
        Modular.to.navigate('/login');
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }
}