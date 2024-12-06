/// Base mixin to represent a single chain item with a possible previous and next item.
mixin Linkable<F, T> {
  F? _prev;
  T? _next;

  set next(T? chainable) {
    _next = chainable;
  }

  set prev(F? chainable) {
    _prev = chainable;
  }

  F? get prev => _prev;

  T? get next => _next;
}
