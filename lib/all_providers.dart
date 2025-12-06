import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod_dersi/sayac_manager.dart';

import 'model/sayac_model.dart';

final titleProvider = Provider<String>((ref) => 'Riverpod Basics');
final titleProvider2 = Provider<String>((ref) => 'Riverpod State Notifier Kullanımı');

final textProvider = Provider<String>((ref) {
  return 'You have pushed the button this many times:';
});

final sayacStateProvider = StateProvider<int>((ref){
  return 0;
});

final sayacNotifierProvider = StateNotifierProvider<SayacManager, SayacModel>((ref) {
  return SayacManager();
});

final ciftMiProvider = Provider<bool>((ref){
  return ref.watch(sayacNotifierProvider).sayac % 2 == 0;
});