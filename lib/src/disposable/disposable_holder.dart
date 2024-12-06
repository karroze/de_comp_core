import 'dart:async';

import 'package:de_comp_core/src/disposable/disposable_mixin.dart';
import 'package:de_comp_core/src/disposable/disposable_wrapper.dart';
import 'package:rxdart/rxdart.dart';

/// Stores disposable entries and allows centralised disposal of them.
class DisposableHolder {
  final _disposables = <DisposableWrapper<Object?>>[];

  void addSink<T>(Sink<T> sink) => addCustomDisposable(
        sink,
        sink.close,
      );

  void addTimer(Timer timer) => addCustomDisposable(
        timer,
        timer.cancel,
      );

  void addDisposable(DisposableMixin disposable) => addCustomDisposable(
        disposable,
        disposable.dispose,
      );

  void addStreamConsumer<T>(StreamConsumer<T> streamConsumer) => addCustomDisposable(
        streamConsumer,
        streamConsumer.close,
      );

  void addStreamController<T>(StreamController<T> streamController) => addCustomDisposable(
        streamController,
        streamController.close,
      );

  void addStreamSubscription<T>(StreamSubscription<T> streamSubscription) => addCustomDisposable(
        streamSubscription,
        streamSubscription.cancel,
      );

  void addCustomDisposable<T>(
    T disposable,
    FutureOr<Object?> Function() dispose,
  ) {
    if (!_disposables.contains(disposable)) {
      _disposables.add(
        DisposableWrapper<T>(
          instance: disposable,
          dispose: dispose,
        ),
      );
    }
  }

  void remove(Object disposable) {
    _disposables.remove(disposable);
  }

  Future<void> dispose() async {
    for (final disposable in _disposables) {
      await disposable.dispose();
    }
    _disposables.clear();
  }
}

extension StreamSubscrptionExtensions<T> on StreamSubscription<T> {
  StreamSubscription<T> addToDisposableHolder(DisposableHolder disposableHolder) {
    disposableHolder.addStreamSubscription(this);
    return this;
  }
}

extension BehaviorSubjectExtensions<T> on BehaviorSubject<T> {
  BehaviorSubject<T> addToDisposableHolder(DisposableHolder disposableHolder) {
    disposableHolder.addStreamController(this);
    return this;
  }
}

extension StreamControllerExtensions<T> on StreamController<T> {
  StreamController<T> addToDisposableHolder(DisposableHolder disposableHolder) {
    disposableHolder.addStreamController(this);
    return this;
  }
}

extension TimerExtensions on Timer {
  Timer addToDisposableHolder(DisposableHolder disposableHolder) {
    disposableHolder.addTimer(this);
    return this;
  }
}
