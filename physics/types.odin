package bear_physics

import glm "core:math/linalg/glsl"

EPSILON :: 0.0001

vec2 :: glm.vec2
vec3 :: glm.vec3
vec4 :: glm.vec4

quat :: glm.quat

Transform :: struct {
  position, scale: vec3,
  orientation: quat,
}

Bounding_Box :: struct {
  min, max: vec3
}

Line_Segment :: struct {
  a, b: vec3
}


Face :: struct {
  indices: [3]u16
}

Plane :: struct {
  normal: vec3,
  d: f32,
}


Sphere :: struct {
  position: vec3,
  radius: f32,
}

Capsule :: struct {
  using line: Line_Segment,
  radius: f32,
}

Lozenge :: struct {
  position: vec3,
  axes: [2]vec3,
  radius: f32,
}

Mesh :: struct {
  vertices: []vec3,
  faces: []Face,
}

Object :: union {
  Sphere,
  Capsule,
}