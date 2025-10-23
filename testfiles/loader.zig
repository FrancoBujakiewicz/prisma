
 const std = @import("std");

 // Entry point
 pub fn main() !void {

    const stdout = std.io.getStdOut().writer();

    try stdout.print("Hello from Zig!\n", .{});

    // Variables
    var number: i32 = 42;
    const name = "Zig";

    try stdout.print("Name: {s}, Number: {}\n", .{ name, number });

    // Conditional
    if (number > 10) {

        try stdout.print("Number is greater than 10\n", .{});

    } else {
        try stdout.print("Number is 10 or less\n", .{});
    }

    // Loop
    var sum: i32 = 0;
    for (0..5) |i| {
        sum += i;
    }
    try stdout.print("Sum from 0 to 4: {}\n", .{ sum });

    // Calling a function
    const result = try safeDivide(10, 2);
    try stdout.print("10 / 2 = {}\n", .{ result });

    // Example of
