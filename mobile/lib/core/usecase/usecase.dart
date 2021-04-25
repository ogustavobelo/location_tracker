abstract class UseCaseFuture<T, P> {
  Future<T> call({required P params});
}

abstract class UseCase<T, P> {
  T call({required P params});
}
