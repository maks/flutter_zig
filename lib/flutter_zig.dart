import 'dart:ffi';

import 'dart:io';

// Fib function from zig
typedef FibFunc = Int32 Function(Int32 a);
typedef Fib = int Function(int a);

class FlutterZigPlugin {
  late final DynamicLibrary dylib;

  FlutterZigPlugin() {
    const libName = 'sample';
    if (Platform.environment.containsKey('FLUTTER_TEST')) {
      dylib = DynamicLibrary.open('linux/lib$libName.so');
    } else {
      dylib = Platform.isIOS ? DynamicLibrary.process() : DynamicLibrary.open('lib$libName.so');
    }
  }

  int fib(int num) {
    final fibPointer = dylib.lookup<NativeFunction<FibFunc>>('fibzig');
    final fib = fibPointer.asFunction<Fib>();
    final result = fib(num);
    return result;
  }
}
