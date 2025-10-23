
 const std = @import("std");

 fn greet(name: []const u8) void {
    std.debug.print("Hello, {s}!\n", .{name});
 }

 pub fn main() void {
    var name: []const u8 = "Alice";
    var age: u8 = 25;

    if (age >= 18) {
        std.debug.print("{s} is an adult.\n", .{name});
    } else {
        std.debug.print("{s} is a minor.\n", .{name});
    }

    var fruits: [3][]const u8 = .{"apple", "banana", "cherry"};
    for (fruits) |fruit| {
        std.debug.print("I like {s}\n", .{fruit});
    }

    // Using the function
    greet(name);

    // Loop example
    var i: u8 = 1;
    while (i <= 5) : (i += 1) {
        std.debug.print("Counting: {d}\n", .{i});
    }
}
