import 'package:de_comp_core/src/disposable/disposable_mixin.dart';

/// Handler that exposes `onDispose` method.
mixin DisposableHandlerMixin implements DisposableMixin {
  Future<void> onDispose() async {}

  @override
  Future<void> dispose() {
    return onDispose();
  }
}
