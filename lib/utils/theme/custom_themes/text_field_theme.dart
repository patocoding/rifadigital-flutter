import 'package:firstly/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextFieldTheme {
  TTextFieldTheme._(); // Construtor privado para prevenir instanciação

  static final InputDecorationTheme lightTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    fillColor: Colors.white, // Cor de preenchimento
    filled: true, // Se o campo deve ser preenchido com a cor de fillColor
    border: OutlineInputBorder( // Bordas normais do campo
      borderSide: const BorderSide(color: TColors.grey, width: 2.0), // Cor e espessura da borda
      borderRadius: BorderRadius.circular(8.0), // Arredondamento da borda
    ),
    enabledBorder: OutlineInputBorder( // Bordas quando o campo está habilitado
      borderSide: const BorderSide(color: TColors.grey, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder( // Bordas quando o campo está focado
      borderSide: const BorderSide(color: Colors.green, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    labelStyle: const TextStyle(color: TColors.black), // Estilo do texto da label
    hintStyle: const TextStyle(color: Colors.grey), // Estilo do texto de hint
  );

  static final InputDecorationTheme darkTextFieldTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    fillColor: Colors.grey[800], // Cor de preenchimento para tema escuro
    filled: true,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    labelStyle: const TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.grey[400]),
  );
}