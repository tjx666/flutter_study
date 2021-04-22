# flutter study

## Key Notes

## TODO

- [x] stateless widget life cycle
- [x] stateful widget life cycle
- [x] page route life cycle
- [x] app life cycle
- [ ] list view
- [ ] keep alive

### Stateless Widget Life Cycle

<img src="https://github.com/tjx666/flutter_study/blob/master/assets/drawio/exports/stateless_widget_life_cycle.png?raw=true" alt="stateless widget life cycle" style="zoom:50%;" />

### Stateful Widget Life Cycle

<img src="https://github.com/tjx666/flutter_study/blob/master/assets/drawio/exports/stateful_widget_life_cycle.png?raw=true" alt="stateful widget life cycle" style="zoom:50%;" />

### page route life cycle

在开发 flutter 时可能会碰到两种路由概念：flutter 自身导航系统的 route 和应用级别的 route。

flutter 自身导航系统的 route：也就是 `MaterialPageRoute`，表示一个 flutter app 内部自身的页面。

应用级别的 route：一个 route 表示一个 app，开发混合应用更常用。

这里探讨的是前者，可以使用 [RouteObserver](https://api.flutter.dev/flutter/widgets/RouteObserver-class.html) 来实现监听其生命周期，最简单的 demo：

```dart
// Register the RouteObserver as a navigation observer.
final routeObserver = RouteObserver<ModalRoute>();
void main() {
  runApp(MaterialApp(
    home: Container(),
    navigatorObservers: [routeObserver],
  ));
}

class RouteAwareWidget extends StatefulWidget {
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

// Implement RouteAware in a widget's state and subscribe it to the RouteObserver.
class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPush() {
    /// Called when the current route has been pushed.
  }

  @override
  void didPushNext() {
    /// Called when a new route has been pushed, and the current route is no
    /// longer visible.
  }

  @override
  void didPop() {
    /// Called when the current route has been popped off.
  }

  @override
  void didPopNext() {
    /// Called when the top route has been popped off, and the current route
    /// shows up.
  }

  @override
  Widget build(BuildContext context) => Container();
}
```

有两个页面 `HomePage` 和 `SecondPage`，`HomePage` 有一个按钮可以跳转到第二页。

```
# 刚进入首页
[HomePage] route did push!
# 点击跳转按钮跳转到第二页
[HomePage] route did push next!
[SecondPage] route did push!
# 点击导航栏返回按键
[HomePage] route did pop next!
[SecondPage] route did pop!
```

得到以下结论：

- `RouteObserver` 提供了 4 个生命周期钩子：`push`, `didPushNext`, `didPopNext`, `pop`
- 页面 `push` 和 `didPopNext` 后用户可见（appear)
- 页面 `pop` 和 `didPushNext` 后用户不可见（disappear）
- flutter 自身页面的切换不会触发页面内部生命周期钩子

### app life cycle

可以使用 [WidgetsBindingObserver](https://api.flutter.dev/flutter/widgets/WidgetsBindingObserver-class.html) 来监听应用的生命周期或者说应用级别路由的生命周期。值得注意的是在混合应用中（例如使用 flutter_boost），flutter 页面和原生页面之间的跳转。

最简单的 demo：

```dart
class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  AppLifecycleState? _notification;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  /// 例如按虚拟按键返回桌面退出 flutter 应用时，将 flutter 应用这个应用级别的 route pop
  @override
  Future<bool> didPopRoute() async {
    print('[HomePage] App Route LifeCycle: pop route');
    return false;
  }

  /// 没见触发过
  @override
  Future<bool> didPushRoute(String route) async {
    print('[HomePage] App Route LifeCycle: push route');
    return false;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _notification = state;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Text('Last notification: $_notification');
  }
}
```

应用的四种状态：

```dart
enum AppLifecycleState {
  /// 应用可见并且可以响应用户交互
  resumed,
  /// 不接受用户交互的状态，例如进入任务列表，苹果手机正在响应 TouchID 识别
  inactive,
  /// 对用户不可见时
  paused,
  /// flutter engine 活着但是所有 flutter 页面被销毁了的时候
  /// 例如在首页只有一个页面时点返回，需要注意的是直接杀后台不会触发，因为 flutter engine 这个时候直接被干掉了
  detached,
}
```
