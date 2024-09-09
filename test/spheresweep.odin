package bear_physics_test

import rl "vendor:raylib"
import "core:math"
import bear "../physics"

sc_capsule := bear.Capsule{
  a = {0, 0, 0},
  b = {0, 1, 0},
  radius = 1
}

sc_sphere := bear.Sphere{
  position = {1, 0.5, 0},
  radius = 1.2
}


sc_test :: proc(offset: bear.vec3) {
  sc_sphere.position = offset + 3 * {math.cos(f32(rl.GetTime())), math.sin(f32(rl.GetTime())), 0}  

  color := rl.RED if bear.sphere_capsule_collide(sc_sphere, sc_capsule) else rl.GREEN
  rl.DrawCapsule(sc_capsule.a + offset, sc_capsule.b + offset, sc_capsule.radius, 5, 4, color)
  rl.DrawSphere(sc_sphere.position, sc_sphere.radius, color)
}