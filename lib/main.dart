import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';
// import 'package:learn_bloc/cubit/counter_cubit.dart';

Future<void> main() async {
  // final cubit = CounterCubit();
  // final subscription = cubit.stream.listen(print);
  // cubit.increment();
  // await Future.delayed(Duration.zero);
  // await subscription.cancel();
  // await cubit.close();

  // CounterCubit()
  //   ..increment()
  //   ..close();

  // print(cubit.state);
  // cubit.increment();
  // print(cubit.state);
  // cubit.close();

  // BlocOverrides.runZoned(
  //   () {
  //     CounterCubit()
  //       ..increment()
  //       ..close();
  //   },
  //   blocObserver: SimpleBlocObserver(),
  // );

  // BlocOverrides.runZoned(
  //   () {
  //     CounterBloc()
  //       ..add(CounterIncrementPressed())
  //       ..close();
  //   },
  //   blocObserver: SimpleBlocObserver(),
  // );

  // final subscription = bloc.stream.listen(print);
  //
  // bloc.add(CounterIncrementPressed());
  // await Future.delayed(Duration.zero);
  // await subscription.cancel();

  // print(bloc.state);
  //
  // bloc.add(CounterIncrementPressed());
  // await Future.delayed(Duration.zero);
  //
  // print(bloc.state);

  // await bloc.close();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<CounterBloc, int>(
          builder: (context, _counter) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementPressed());
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () {
                  context.read()<CounterBloc>().add(CounterDecrementPressed());
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
