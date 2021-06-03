class FutureSettledItem {
  String status;
  dynamic value;
  dynamic reason;

  FutureSettledItem(this.status);
}

extension FutureExtension<T> on Future<T> {
  static Future<List<FutureSettledItem>> allSettled(List<Future> futures) {
    FutureSettledItem onFulfilled(dynamic value) {
      return FutureSettledItem('fulfilled')..value = value;
    }

    FutureSettledItem onRejected(dynamic reason) {
      return FutureSettledItem('rejected')..reason = reason;
    }

    return Future.wait(
        futures.map((e) => e.then(onFulfilled, onError: onRejected)));
  }
}

void main() async {
  final f1 = Future.error(1);
  final f2 = Future.delayed(Duration(milliseconds: 2000), () => 666);
  final result = await FutureExtension.allSettled([f2, f1]);
  result.forEach((element) => print(element.value ?? element.reason));
}
