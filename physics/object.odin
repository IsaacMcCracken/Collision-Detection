package bear_physics

check_collion_object :: proc(a, b: Object) -> bool {
  switch obj_a in a {
    case Capsule:
      switch obj_b in b {
        case Sphere: return sphere_capsule_collide(obj_b, obj_a)
        case Capsule: return false
      }
    case Sphere:
      switch obj_b in b {
        case Sphere: return false
        case Capsule: return sphere_capsule_collide(obj_a, obj_b)
      }
  }

  return false
}