import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      // addError(Exception('increment error!'), StackTrace.current);
      emit(state + 1);
    });

    on<CounterDecrementPressed>((event, emit) {
      emit(state - 1);
    });
  }
  //
  // @override
  // void onEvent(CounterEvent event) {
  //   super.onEvent(event);
  //   print(event);
  // }
  //
  // @override
  // void onChange(Change<int> change) {
  //   super.onChange(change);
  //   print(change);
  // }
  //
  // @override
  // void onTransition(Transition<CounterEvent, int> transition) {
  //   super.onTransition(transition);
  //   print(transition);
  // }
  //
  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print('$error, $stackTrace');
  //   super.onError(error, stackTrace);
  // }
}

// class SimpleBlocObserver extends BlocObserver {
//   @override
//   void onEvent(Bloc bloc, Object? event) {
//     // TODO: implement onEvent
//     super.onEvent(bloc, event);
//     print('${bloc.runtimeType} $event');
//   }
//
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     // TODO: implement onChange
//     super.onChange(bloc, change);
//     print('${bloc.runtimeType} $change');
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     // TODO: implement onTransition
//     super.onTransition(bloc, transition);
//     print('${bloc.runtimeType} $transition');
//   }
//
//   // @override
//   // void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//   //   // TODO: implement onError
//   //   print('${bloc.runtimeType} $error $stackTrace');
//   //   super.onError(bloc, error, stackTrace);
//   // }
//
// }
