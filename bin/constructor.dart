class Foo {
  String name;
  int? age;

  Foo(this.name);

  // 和 class 同名的构造器就是默认构造器
  // 不能定义多个默认构造器
  // Foo(this.name, tint age);

  factory Foo.ofAge(String name, int age) {
    return Foo(name);
  }
}
