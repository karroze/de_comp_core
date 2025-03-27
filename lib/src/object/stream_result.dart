/// Represents a [Stream] result witch consists of [Data], [Loading] and nullable [Error].
final class StreamResult<Data, Loading, Error> {
  const StreamResult({
    required this.data,
    required this.loading,
    required this.error,
  });

  final Data data;
  final Loading loading;
  final Error? error;

  StreamResult<Data, Loading, Error> copyWith({
    Data? data,
    Loading? loading,
    Error Function()? error,
  }) =>
      StreamResult(
        data: data ?? this.data,
        loading: loading ?? this.loading,
        error: error != null ? error() : this.error,
      );
}
