import 'package:de_comp_core/src/data_pipeline/chain/chainable.dart';
import 'package:de_comp_core/src/data_pipeline/chain/linkable_mixin.dart';

abstract base class ChainValidator<T> with Linkable<Chainable<Object?, T>, Chainable<Object?, T>> {
  T validate(T input);
}
