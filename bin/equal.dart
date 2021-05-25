class Foo {
  @override
  bool operator ==(Object other) {
    return true;
  }

  @override
  int get hashCode => super.hashCode;
}

void main() {
  // dart 中没有包装类的概念，一切皆对象
  print(1 is Object); // => true
  print(1 == int.parse('1')); // => true
  print(int.parse('1') is Object); // => true;
  print(identical(1, 1)); // => true
  print(identical(1, int.parse('1'))); // => true
  
  // object type
  final obj1 = Object();
  final obj2 = Object();
  print(obj1 == obj2); // => false
  print(identical(obj1, obj2)); // => false

  final foo1 = Foo();
  final foo2 = Foo();
  print(foo1 == foo2); // => true
  print(identical(foo1, foo2)); // => false

  // 开启了 null safety 后返回 false，没开启返回 true
  // 说明在 null safety 环境下 null 不继承于 Object
  print(null is Object); 
  // Object obj = null;
  // null 也定义了 toString 方法，并不是继承于 Object
  print(null.toString()); // => null
}