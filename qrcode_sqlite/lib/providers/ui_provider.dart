import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class UIProvider extends ChangeNotifier{

  int _selectedMenuOpt =1;


  int get selectedMenuOpt {
     return this._selectedMenuOpt;
  }
  set selectedMenuOpt (int i){
    _selectedMenuOpt= i;
    notifyListeners();
  }
}