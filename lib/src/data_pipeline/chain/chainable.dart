import 'package:de_comp_core/src/data_pipeline/chain/linkable_mixin.dart';
import 'package:de_comp_core/src/data_pipeline/transform/chain_transformer.dart';
import 'package:de_comp_core/src/data_pipeline/validator/chain_validator.dart';

/// Represents a single Chain in a pipeline and provides API to chain with other.
class Chainable<F, T> with Linkable<Chainable<Object?, F>, Chainable<T, Object?>> {
  Chainable.fromValue(this._value);

  final T _value;

  Chainable<T, OUT> transform<OUT>(ChainTransformer<T, OUT> transformer) {
    transformer.prev = this;

    final next = transformer.convert(_value);
    return _toChainable(next);
  }

  Chainable<T, T> validate(ChainValidator<T> validator) {
    validator.prev = this;

    final next = validator.validate(_value);
    return _toChainable(next);
  }

  Chainable<T, OUT> _toChainable<OUT>(OUT out) {
    final result = Chainable<T, OUT>.fromValue(out);
    next = result;
    result.prev = this;
    return result;
  }

  T getResult() => _value;
}
