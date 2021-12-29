import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BasicCamProvider extends ChangeNotifier {
  int _optionNavigation = 0;
  bool _changeImage = false;

  XFile _fileImage = XFile('');
  String _fileImageError = '* Debe seleccionar una imagen';

  /* GET y SET de optionNavigation */

  int get optionNavigation => _optionNavigation;

  set optionNavigation(int value) {
    _optionNavigation = value;
    notifyListeners();
  }

  bool get changeImage => _changeImage;

  /* GET y SET de fileImage */

  XFile get fileImage => _fileImage;

  set fileImage(XFile value) {
    _fileImage = value;
    _changeImage = true;

    _fileImageError = '';

    if (_fileImage.path == '') {
      _fileImageError = 'Debe seleccionar una imagen';
    }

    notifyListeners();
  }

  String get fileImageError => _fileImageError;
}
