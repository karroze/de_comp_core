import 'package:de_comp_core/src/data_pipeline/chain/chainable.dart';
import 'package:de_comp_core/src/data_pipeline/chain/linkable_mixin.dart';

/// Provides an API for a chain item to transform validate instance of [T].
///
/// If validation has failed, an [Exception] should be raised.
abstract base class ChainValidator<T> with Linkable<Chainable<Object?, T>, Chainable<Object?, T>> {
  T validate(T input);
}
