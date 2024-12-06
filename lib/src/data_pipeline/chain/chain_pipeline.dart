import 'package:de_comp_core/src/data_pipeline/chain/chainable.dart';

class ChainPipeline {
  static Chainable<void, T> startWithValue<T>(T value) {
    return Chainable.fromValue(value);
  }
}
