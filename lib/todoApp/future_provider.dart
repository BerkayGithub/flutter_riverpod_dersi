import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_dersi/todoApp/models/cat_fact_model.dart';

final httpClientProvider = Provider((ref) {
  return Dio(BaseOptions(baseUrl: "https://catfact.ninja"));
});

final catFactsProvider = FutureProvider.autoDispose.family<List<Datum>?, Map<String, dynamic>>((ref, parametreMap) async {
  final dio = ref.watch(httpClientProvider);
  //final response = await dio.get("/facts", queryParameters: {"limit" : parametreMap["limit"], "max_length" : parametreMap["max_length"]});
  final response = await dio.get("/facts", queryParameters: parametreMap);
  ref.keepAlive();
  if(response.statusCode == 200){
    final list = CatFactModel.fromMap(response.data).data;
    return list;
  }
});

class FutureProviderExample extends ConsumerWidget {
  const FutureProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var liste = ref.watch(catFactsProvider(const {"limit": 6, "max_length":60}));
    return Scaffold(
      body: SafeArea(
          child: liste.when(data: (_liste){
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(_liste[index].fact!),
              );
            }, itemCount: _liste!.length);
          }, error: (err, stack){
            return Center(child: Text("hata çıktı ${err.toString()}"));
          }, loading: (){
            return Center(child: CircularProgressIndicator());
          })
      ),
    );
  }
}
