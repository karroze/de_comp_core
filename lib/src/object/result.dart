import 'package:meta/meta.dart';

@optionalTypeArgs
sealed class Result<SUCCESS_TYPE, FAILURE_TYPE> {
  const Result._();

  const factory Result.success(SUCCESS_TYPE value) = ResultSuccess<SUCCESS_TYPE, FAILURE_TYPE>;

  const factory Result.failure(FAILURE_TYPE error) = ResultFailure<SUCCESS_TYPE, FAILURE_TYPE>;

  @mustBeOverridden
  T when<T>({
    required T Function(SUCCESS_TYPE value) success,
    required T Function(FAILURE_TYPE failure) failure,
  });
}

final class ResultSuccess<SUCCESS_TYPE, FAILURE_TYPE> extends Result<SUCCESS_TYPE, FAILURE_TYPE> {
  const ResultSuccess(this.value) : super._();

  final SUCCESS_TYPE value;

  @override
  T when<T>({
    required T Function(SUCCESS_TYPE value) success,
    required T Function(FAILURE_TYPE failure) failure,
  }) {
    return success(value);
  }
}

final class ResultFailure<SUCCESS_TYPE, FAILURE_TYPE> extends Result<SUCCESS_TYPE, FAILURE_TYPE> {
  const ResultFailure(this.error) : super._();

  final FAILURE_TYPE error;

  @override
  T when<T>({
    required T Function(SUCCESS_TYPE value) success,
    required T Function(FAILURE_TYPE failure) failure,
  }) {
    return failure(error);
  }
}

typedef ResultFuture<SUCCESS_TYPE, FAILURE_TYPE> = Future<Result<SUCCESS_TYPE, FAILURE_TYPE>>;
typedef ResultStream<SUCCESS_TYPE, FAILURE_TYPE> = Stream<Result<SUCCESS_TYPE, FAILURE_TYPE>>;
