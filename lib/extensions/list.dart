extension ListExtension<T> on List<T> {
  /// 空安全版 elementAt
  T? nullAwareAt(int index) {
    if (index < 0 || index >= this.length) {
      return null;
    }

    return this.elementAt(index);
  }

  /// 稳定的排序算法，dart 内置的排序算法是不稳定的
  void stableSort(int Function(T, T) compare) {
    for (int i = 0, indexOfMin = 0, max = this.length - 1; i < max; i++) {
      indexOfMin = i;
      for (int j = i + 1; j <= max; j++) {
        if (compare(this[indexOfMin], this[j]) > 0) {
          indexOfMin = j;
        }
      }

      if (indexOfMin != i) {
        final temp = this[i];
        this[i] = this[indexOfMin];
        this[indexOfMin] = temp;
      }
    }
  }

  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    for (var index = 0; index < length; index++) {
      yield convert(index, this[index]);
    }
  }
}
