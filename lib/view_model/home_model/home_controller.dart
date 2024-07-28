import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../repository/api_repository.dart';

class HomeController extends ChangeNotifier {
  HomeController({required this.apiRepository});
  final ApiRepository apiRepository;

  bool _pageViewasMenu = false;

  bool get pageViewasMenu => _pageViewasMenu;

  setpageViewasMenu() {
    _pageViewasMenu = !_pageViewasMenu;
    notifyListeners();
  }
}
