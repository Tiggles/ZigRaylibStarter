const rl = @import("raylib_base.zig"); // For now, import raylib from this, as importing the raylib source seems to cause issues.

const HELLO_TEXT = "Hello, and good luck with your project.";
const FONT_SIZE = 24;

pub fn main() !void {
    var windowWidth: i32 = 800;
    var windowHeight: i32 = 600;
    rl.SetTargetFPS(60);
    rl.InitWindow(windowWidth, windowHeight, "ArPeeGee");
    rl.SetWindowState(rl.FLAG_WINDOW_RESIZABLE);
    defer rl.CloseWindow();

    const welcomeTextWidth = rl.MeasureText(HELLO_TEXT, 24);

    while (!rl.WindowShouldClose()) {
        rl.BeginDrawing();
        {
            rl.ClearBackground(rl.BLACK);
            rl.DrawText(HELLO_TEXT, @divFloor(windowWidth, 2) - @divFloor(welcomeTextWidth, 2), @divFloor(windowHeight, 2) - FONT_SIZE / 2, FONT_SIZE, rl.WHITE);
        }
        rl.EndDrawing();

        windowWidth = rl.GetScreenWidth();
        windowHeight = rl.GetScreenHeight();
    }
}
