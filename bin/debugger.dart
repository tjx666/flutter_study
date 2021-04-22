import 'dart:developer';

void bubbleSort<T>(List<T> list, int Function(T a, T b) compare) {
  for (int i = 0, len = list.length - 1, swapped = 0; i < len; i++) {
    swapped = 0;
    for (int j = 0; j < len - i; j++) {
      debugger();
      if (compare(list[j], list[j + 1]) > 0) {
        if (swapped == 0) swapped = 1;
        final temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
    if (swapped == 0) return;
  }
}

void main() {
  List<int> ls = [2, 1, 4, 3, 5, 6];
  bubbleSort<int>(ls, (a, b) => a - b);
  print(ls);
}
