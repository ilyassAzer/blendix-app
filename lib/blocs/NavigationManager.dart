import 'dart:async';

import 'package:dash/dash.dart';

class NavigationManager extends Bloc{

  StreamController<int> _indexController = StreamController<int>.broadcast();

  void selectedIndex(int index) {
    _indexController.sink.add(index);
  }

  Stream<int> get indexStream => _indexController.stream;

  static Bloc instance() => NavigationManager();

  @override
  dispose() {
    _indexController.close();
  }

}