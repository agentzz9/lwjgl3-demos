/*
 * Copyright LWJGL. All rights reserved.
 * License terms: https://www.lwjgl.org/license
 */
#version 110

uniform mat4 invViewProj;

varying vec3 dir;

void main(void) {
  // Compute the view direction in world-space by unprojecting the clip space
  // (in this case NDC space) fullscreen quad vertex coordinates by transforming
  // them with the inverse of the view-projection matrix.
  vec4 tmp = invViewProj * vec4(gl_Vertex.xy, 0.0, 1.0);

  // Do perspective divide to get from homogeneous space to real 3D coordinates.
  dir = tmp.xyz / tmp.w;

  // Simply pass-through the vertex which was already in clip space.
  gl_Position = gl_Vertex;
}
