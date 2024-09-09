package bear_physics

import glm "core:math/linalg/glsl"

barycentric_coodinates :: proc(p, a, b, c: vec3) -> (u, v, w: f32) {
  v0, v1, v2 := b - a, c - a, p - a

  d00 := glm.dot(v0, v0)
  d01 := glm.dot(v0, v1)
  d11 := glm.dot(v1, v1)
  d20 := glm.dot(v2, v0)
  d21 := glm.dot(v2, v1)
  denom := d00 * d11 - d01 * d01
  v = (d11 * d20 - d01 * d01) / denom
  w = (d00 * d21 - d01 * d20) / denom
  u = 1 - v - w

  return u, v, w
}

point_on_triangle :: proc(p, a, b, c: vec3) -> bool {
  u, v, w := barycentric_coodinates(p, a, b, c)
  return v >= 0 && w >= 0 && (v + w) <= 1
}

plane_from_points :: proc(a, b, c: vec3) -> (plane: Plane) {
  plane.normal = glm.normalize(glm.cross(b- a, c - a))
  plane.d = glm.dot(plane.normal, a)
  return plane
}

line_segment_closest_points :: proc(l0, l1: Line_Segment) -> (c0, c1: vec3) {
  d1, d2 := l0.b - l0.a, l1.b - l0.a
  r := l0.a - l1.a
  a := glm.dot(d1, d1)
  e := glm.dot(d2, d2)
  f := glm.dot(d2, r)

  if a <= EPSILON && e <= EPSILON {

  }
  return  
}


line_segment_point_sqr_dist :: proc(l: Line_Segment, p: vec3) -> (dist_sqr: f32) {
  ab := l.b - l.a
  ap := p - l.a
  bp := p - l.b
  
  e := glm.dot(ap, ab)
  
  if e <= 0 do return glm.dot(ap, ap)
  
  
  f := glm.dot(ab, ab)
  
  if e >= f do return glm.dot(bp, bp)
  
  return glm.dot(ap, ap) - e * e / f
}


plane_closest_point_vec3 :: proc(p: vec3, plane: Plane) -> (point: vec3) {
  t := glm.dot(plane.normal, p) - plane.d
  return p - t * plane.normal
}

plane_closest_point :: proc{
  plane_closest_point_vec3,
}