import 'package:de_comp_core/de_comp_core.dart';

/// Represents a [Stream] result witch consists of [Data], [Loading] and nullable [Error].
///
/// This variant of a [StreamResult] supports extra [Meta] field.
/// This can be useful if there's additional info that should be returned from [StreamResult],
/// i.e. source of that data (local, remote etc.).
final class StreamResultMeta<Data, Loading, Error, Meta extends Object> {
  const StreamResultMeta({
    required this.data,
    required this.loading,
    required this.error,
    this.meta,
  });

  final Data data;
  final Loading loading;
  final Error? error;
  final Meta? meta;

  StreamResultMeta<Data, Loading, Error, Meta> copyWith({
    Data? data,
    Loading? loading,
    Error Function()? error,
    Meta Function()? meta,
  }) =>
      StreamResultMeta(
        data: data ?? this.data,
        loading: loading ?? this.loading,
        error: error != null ? error() : this.error,
        meta: meta != null ? meta() : this.meta,
      );
}
