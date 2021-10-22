const std = @import("std");

// pub fn main() void {
//     const x: i32 = fibzig(7);
//     std.debug.print("Hello, {d}!\n", .{x});
// }

export fn fibzig(n: i32) i32 {
  if (n <= 2) {
    return 1;
  } else {
    return fibzig(n-1) + fibzig(n-2);
  }
}
