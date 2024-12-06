import 'package:de_comp_core/src/disposable/disposable_holder.dart';

mixin DisposableHolderMixin {
  final _disposableHolder = DisposableHolder();

  DisposableHolder get disposableHolder => _disposableHolder;
}
