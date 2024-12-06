import 'package:de_comp_core/src/disposable/disposable_mixin.dart';

mixin DisposableHandlerMixin implements DisposableMixin {
  Future<void> onDispose() async {}

  @override
  Future<void> dispose() {
    return onDispose();
  }
}
