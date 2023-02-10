import 'dart:async';

import '../../base/base_view_model.dart';

class MainViewModel extends BaseView
    with MainViewModelInput, MainViewModelOutput {
  final StreamController _currentIndexStreamController =
      StreamController<int>.broadcast();
  int _currentIndex = 0;
  //input
  @override
  Sink get inputCurrentIndex => _currentIndexStreamController.sink;
// output
  @override
  Stream<int> get outputCurrentIndex =>
      _currentIndexStreamController.stream.map((index) => index);
  //method
  @override
  void dispose() {
    _currentIndexStreamController.close();
  }

  @override
  void init() {
    inputCurrentIndex.add(_currentIndex);
  }

  @override
  void setCurrentIndex(int index) {
    _currentIndex = index;
    inputCurrentIndex.add(_currentIndex);
  }
}

abstract class MainViewModelInput {
  Sink get inputCurrentIndex;
  void setCurrentIndex(int index);
}

abstract class MainViewModelOutput {
  Stream<int> get outputCurrentIndex;
}
