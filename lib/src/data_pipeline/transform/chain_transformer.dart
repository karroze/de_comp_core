import 'dart:convert';

import 'package:de_comp_core/src/data_pipeline/chain/chainable.dart';
import 'package:de_comp_core/src/data_pipeline/chain/linkable_mixin.dart';

abstract base class ChainTransformer<IN, OUT> extends Converter<IN, OUT?>
    with Linkable<Chainable<Object?, IN>, Chainable<OUT, Object?>> {
  @override
  OUT convert(IN input);
}
