# Flutter Zig Demo Plugin 

Plugin demonstrating using Zig with Dart FFI.

## Getting Started

Currently this is just a minimal Flutter plugin scaffold configured to allow calling native library via Dart FFI.

For now as a POC, a minimal library written in [Zig](https://ziglang.org/) is being used to demonstrate cross-compiling for to different platforms.

The reason Zig is used to create the demonstration native library placeholder is because it is excellent at cross-compiling, making it trivial to x-compile for multiple platforms from any platform (including Linux) with no extra tooling or complex configuration files required. 

Below is how to build for Linux (desktop) and Android on Linux (Ubuntu):

```sh
>cd platform
>zig build-lib -dynamic sample.zig # build of Linux desktop
>file libsample.so 
libsample.so: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, with debug_info, not stripped


>zig build-lib -dynamic -target aarch64-linux-musleabi sample.zig
>file libsample.so
libsample.so: ELF 64-bit LSB shared object, ARM aarch64, version 1 (SYSV), dynamically linked, with debug_info, not stripped
```

After each of the above zig commands, move the newly built .so to correct location:

For desktop Linux:
```
>cd platform
>mv libsample.so linux_64/
```

For Android arm64:
```
mv libsample.so ../android/src/main/jniLibs/arm64-v8a/
```

For iOS:

```
zig build-lib -target aarch64-ios sample.zig
mv libsample.a ../ios/
```


### References

very useful for figuring out where to put libs and how to get iOS working:
https://medium.com/flutter-community/using-ffi-on-flutter-plugins-to-run-native-rust-code-d64c0f14f9c2


https://medium.com/flutter-community/build-and-deploy-native-c-libraries-with-flutter-cc7531d590b5
https://github.com/dart-lang/ffi/issues/118
https://flutter.dev/docs/development/platform-integration/c-interop