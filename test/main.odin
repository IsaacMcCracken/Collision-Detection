package bear_physics_test

import rl "vendor:raylib"
import "../physics"


main :: proc() {
  rl.InitWindow(800, 800, "Physics Test") 
  defer rl.CloseWindow()
  rl.SetTargetFPS(60)
  rl.DisableCursor()



  cam := rl.Camera3D{
    position = {0, 0, -10},
    up = {0, 1, 0},
    fovy = 80,
    projection = .PERSPECTIVE
  }

  for !rl.WindowShouldClose() {
    rl.UpdateCamera(&cam, .FIRST_PERSON)
    rl.BeginDrawing()
      rl.ClearBackground({20, 30, 30, 255})

      rl.BeginMode3D(cam)
        sc_test({})
      rl.EndMode3D()
      
      
      rl.DrawFPS(10, 10)
    rl.EndDrawing()
  }
}