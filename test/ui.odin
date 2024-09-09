package bear_physics_test

import rl "vendor:raylib"
import mu "vendor:microui"

muctx: mu.Context


@(init) init_ui :: proc() {
  mu.init(muctx)
}