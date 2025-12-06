import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod_dersi/model/sayac_model.dart';

class SayacManager extends StateNotifier<SayacModel> {
  SayacManager() : super(SayacModel(sayac: 0));

  void arttir() {
    var oankiSayacDegeri = state.sayac;
    state = SayacModel(sayac: (oankiSayacDegeri + 1));
  }

  void azalt() {
    var oankiSayacDegeri = state.sayac;
    state = SayacModel(sayac: (oankiSayacDegeri - 1));
  }
}
