# flutter_riverpod_dersi

A new Flutter project that applies state management using riverpod.

## Riverpod

A Reactive Caching and Data-binding Framework.Declare shared state from anywhere
No need to jump between your main.dart and your UI files anymore.
Place the code of your shared state where it belongs, be it in a separate package or right next to the Widget that needs it, without losing testability.
A state management library. You can declare your variables once and use them anywhere in your app using providers.

main.dart

    void main() {
        runApp(
        ProviderScope(child: const RiverpodBasics())
        );
    }

riverpod_basics.dart

    final titleProvider = Provider<String>((ref) => 'Riverpod Basics');
    final textProvider = Provider<String>((ref) {
        return 'You have pushed the button this many times:';
    });
    
    final sayacStateProvider = StateProvider<int>((ref){
        return 0;
    });

    title: Consumer(
        builder: (context, ref, child) {
        var title = ref.watch(titleProvider);
        return Text(title);
        },
    ),
    
    var text = ref.watch(textProvider);
    return Text(text);
    
    var sayac = ref.watch(sayacStateProvider);
    return Text('$sayac', style: Theme.of(context).textTheme.headlineMedium);
    
    return FloatingActionButton(
        onPressed: (){
        ref.read(sayacStateProvider.notifier).state++;
    },