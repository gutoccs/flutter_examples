import 'package:flutter/material.dart';

class CreditCardProvider extends ChangeNotifier {
  // Credit Card Data

  String _cardNumber = '';
  String _cardNumberError = '';
  String _expiryDate = '';
  String _expiryDateError = '';
  String _cardHolderName = '';
  String _cardHolderNameError = '';
  String _cvvCode = '';
  String _cvvCodeError = '';

  bool _isCvvFocused = false;

  // GET y SET de _cardNumber

  String get getCardNumber => _cardNumber;

  set setCardNumber(String value) {
    _cardNumber = value;
    // Aquí realizar las validaciones - Here do the validations
    _cardNumberError = '';
    notifyListeners();
  }

  String get getCardNumberError => _cardNumberError;

  // GET y SET de _expiryDate

  String get getExpiryDate => _expiryDate;

  set setExpiryDate(String value) {
    _expiryDate = value;
    // Aquí realizar las validaciones - Here do the validations
    _expiryDateError = '';
    notifyListeners();
  }

  String get getExpiryDateError => _expiryDateError;

  // GET y SET de _cardHolderName

  String get getCardHolderName => _cardHolderName;

  set setCardHolderName(String value) {
    _cardHolderName = value;
    // Aquí realizar las validaciones - Here do the validations
    _cardHolderNameError = '';
    notifyListeners();
  }

  String get getCardHolderNameError => _cardHolderNameError;

  // GET y SET de _cvvCode

  String get getCvvCode => _cvvCode;

  set setCvvCode(String value) {
    _cvvCode = value;
    // Aquí realizar las validaciones - Here do the validations
    _cvvCodeError = '';
    notifyListeners();
  }

  String get getCvvCodeError => _cvvCodeError;

  // GET y SET de _isCvvFocused

  bool get getIsCvvFocused => _isCvvFocused;

  set setIsCvvFocused(bool value) {
    _isCvvFocused = value;
    notifyListeners();
  }
}
