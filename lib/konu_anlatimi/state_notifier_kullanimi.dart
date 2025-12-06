import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'all_providers.dart';

class StateNotifierKullanimi extends StatelessWidget {
  const StateNotifierKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Consumer(
          builder: (context, ref, child) {
            var title = ref.watch(titleProvider2);
            return Text(title);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyText(),
            MyCounterText(),
            CiftMiWidget()
          ],
        ),
      ),
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var text = ref.watch(textProvider);
    return Text(text);
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sayac = ref.watch(sayacNotifierProvider).sayac;
    return Text('$sayac', style: Theme.of(context).textTheme.headlineMedium);
  }
}

class MyFloatingActionButton extends ConsumerWidget {

  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: (){
        //ref.read(sayacNotifierProvider) bize SayacModel sınıfını verir.
        //arttirma ve azaltma metodları StateManager sınıfı içinde olduğundan
        //bu sınıfı açmak için .notifier metodunu çalıştırmak gerek
        ref.read(sayacNotifierProvider.notifier).arttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class CiftMiWidget extends ConsumerWidget{
  const CiftMiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(ref.watch(ciftMiProvider) ? "ÇİFT" : "TEK");
  }

}