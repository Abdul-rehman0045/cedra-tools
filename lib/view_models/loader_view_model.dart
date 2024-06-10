import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loaderViewModel = ChangeNotifierProvider((ref) => LoaderViewModel());

class LoaderViewModel extends ChangeNotifier {
  bool isLoading = false;

  void showLoader() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoader() {
    isLoading = false;
    notifyListeners();
  }
}
