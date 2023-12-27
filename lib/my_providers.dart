import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class my_providers with ChangeNotifier {
  List<String> _forms_name = [];
  List<Color> _scc = []; // selected container color
  bool _abc = true;
  List<String> get Forms_name => _forms_name;
  List<Color> get SCC => _scc;
  bool get Abc => _abc;
  void add_form_name(String name) {
    _forms_name.add(name);
    notifyListeners();
  }

  void set_abc(bool a) {
    _abc = a;
    notifyListeners();
  }

  void add_colors(Color a) {
    _scc.add(a);
    notifyListeners();
  }

  void replace_color(int index) {
    _scc.replaceRange(index, index + 1, [Color.fromARGB(108, 255, 255, 255)]);
    print(".....................");

    notifyListeners();
  }
}
