// late 用途一：声明被延迟初始化的全局变量，全局变量无法确定运行时是否被初始化，可能被别的模块导入然后初始化
// int a;
late int a;

class TestNullSafety {
  // late 用途一：声明被延迟初始化的实例变量
  late int a;
  int b = 1;

  // late 用途二：将初始化语句惰化，需要访问 this 来初始化的字段，因为 late 的初始化语句是惰性的，会在该字段第一次访问时才被初始化
  late int c = this.b + 2;

  TestNullSafety() {
    a = 1;
  }
}

void main() {
  a = 999;

  // 局部 non-nullable 变量 可以被在使用时可以被编译器确定是否已经被初始化
  int lineCount;

  // The non-nullable local variable 'lineCount' must be assigned before it can be usedÎ
  // print(lineCount);

  lineCount = 666;
  print(lineCount);

  
  String helloWorld() {
    print('after 3 seconds');
    return '...';
  }

  late String lazyToBeInitialized = helloWorld();
  // helloWorld 不会被立即执行，而是在 3 秒后第一次访问时执行
  Future.delayed(const Duration(seconds: 3), () => print(lazyToBeInitialized));
}
