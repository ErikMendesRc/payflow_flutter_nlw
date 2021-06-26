import 'package:boletos/shared/constants/constants.dart';
import 'package:boletos/shared/models/boleto_models.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? Constants.VALIDAR_NOME_VAZIO : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? Constants.VALIDAR_VENCIMENTO_VAZIO : null;
  String? validateValor(double value) =>
      value == 0 ? Constants.VALIDAR_VALOR_VAZIO : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? Constants.VALIDAR_CODIGO_VAZIO : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    model = model.copyWith(
        name: name, dueDate: dueDate, value: value, barcode: barcode);
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList("boletos") ?? <String>[];
    boletos.add(model.toJson());
    await instance.setStringList("boletos", boletos);
    return;
  }

  Future<bool> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      await saveBoleto();
      return true;
    } else {
      return false;
    }
  }
}
