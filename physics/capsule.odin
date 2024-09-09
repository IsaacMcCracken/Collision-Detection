package bear_physics



sphere_sphere_collision :: proc(a, b: Sphere) -> (depth: f32, norm: vec3, ok: bool) {
  dif := b.position - a.position
  dist_sqr := glm.dot(dif, dif)
  r := a.radius + b.radius
  if dist_sqr >=  r * r do return 

  
}

sphere_capsule_collide :: proc(s: Sphere, c: Capsule) -> (col: bool) {
  dist_sqr := line_segment_point_sqr_dist(c, s.position)
  combined_radius := s.radius + c.radius

  return dist_sqr <= combined_radius * combined_radius
}