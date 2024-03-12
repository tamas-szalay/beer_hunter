import 'package:beer_hunter/layout/screen_content_widget.dart';
import 'package:flutter/material.dart';

class BaseViewmodel<T> extends ChangeNotifier {
  
  Object? get error => _error;
  @protected
  set error(Object? value) => _error = value;
  Object? _error;

  bool get isLoading => _isLoading;
  @protected
  set isLoading(bool value) => _isLoading = value;
  bool _isLoading = false;

  T? _data;
  bool get hasData => data != null;
  T? get data => _data;
  @protected
  set data(T? value) {
    _data = value;
  }

  @protected
  Future<void> performLoading() async {}

  Future<void> load() async {
    if (isLoading) {
      return;
    }
    loadStarted();
    await performLoading();
    loadFinished();
  }

  @protected
  void loadStarted() {
    error = null;
    isLoading = true;
    notifyListeners();
  }

  @protected
  void loadFinished({bool preventDispose = false}) {
    isLoading = false;
    notifyListeners();
  }

  ScreenContentState get screenContentState {
    if (!hasData && isLoading) {
      return ScreenContentState.loading;
    }
    if (error != null && !isLoading) {
      return ScreenContentState.error(error.toString());
    }
    if (!hasData && !isLoading && error == null) {
      return ScreenContentState.empty;
    }
    return ScreenContentState.content;
  }

  void initModel() {}
}
