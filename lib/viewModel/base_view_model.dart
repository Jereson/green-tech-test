import 'package:flutter/material.dart';

enum ViewState { busy, done, error, none, noInternet }

class BaseViewModel with ChangeNotifier {

  ViewState viewState = ViewState.none;
  String viewMessage = '';
  String errorMessage = '';
  bool _disposed = false;

 
  bool get hasEncounteredError =>
      viewState == ViewState.error || viewState == ViewState.noInternet;
  bool get isBusy => viewState == ViewState.done;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }

  void setState({ViewState? viewState, String? viewMessage}) {
    if (viewState != null) this.viewState = viewState;
    if (viewMessage != null) this.viewMessage = viewMessage;
    if (!_disposed) notifyListeners();
  }

    String? emailValitor(String? value) {
    if (value!.trim().isEmpty) {
      return 'Field required';
    } else if (!value.contains('@') ||
        !value.contains('.com') ||
        value.contains(' ')) {
      return 'Invalid email';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'Field required';
    } else if (value.length < 11) {
      return 'Invalid phone number';
    }
    return null;
  }

  // String? nameValidator(String? value) {
  //   if (value!.trim().isEmpty) {
  //     return 'Field required';
  //   } else if (value.length > 1) {
  //     return 'Single name is required';
  //   }
  //   return null;
  // }

  String? nameValidator(String? value) {
    return value!.trim().isEmpty ? 'Field required' : null;
  }

  String? passwordValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'Field required';
    } else if (value.contains(' ') || value.length < 8) {
      return 'Password of more than 8 characters is required';
    }
    return null;
  }

  String? amountValidator(String? value) {
    if (value!.trim().isEmpty) {
      return 'Field required';
    } else if (num.tryParse(value)! <= 0 || value[0] == '0') {
      return 'Invalid amount';
    } else {
      return null;
    }
  }

}
