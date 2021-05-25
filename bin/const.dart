class ImmutablePoint {
  final double x;
  final double y;

  const ImmutablePoint(double x, double y)
      : this.x = x,
        this.y = y;
}

/*
 * 通过 devtools 可以发现程序运行一开始就存在 5 个 ImmutablePoint 实例
 */
void main() {
  const p1 = ImmutablePoint(1, 1);
  const p2 = ImmutablePoint(1, 1);
  print(p1 == p2); // => true
  print(identical(p1, p2)); // => true

  const p3 = ImmutablePoint(2, 2);
  print(identical(p1, p3)); // => false

  const p4 = ImmutablePoint(3, 3);
  var p5 = const ImmutablePoint(3, 3);
  print(identical(p4, p5)); // => true

  // 常量在在运行期就存在了一直到程序执行结束
  late int hashCode;
  {
    ImmutablePoint? p6 = const ImmutablePoint(4, 4);
    hashCode = p6.hashCode;
    p6 = null;
  }
  const p6 = ImmutablePoint(4, 4);
  print(p6.hashCode == hashCode); // => true;

  if (false) {
    const ImmutablePoint(5, 5);
  }
}
