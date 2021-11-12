/// @description Draw the 3D world

draw_clear(c_black);

// 3D projections require a view and projection matrix
var camera = camera_get_active();
var camera_distance = 160;
/*
var xfrom = Player.x;
var yfrom = Player.y;
var zfrom = Player.z + 64;
var xto = xfrom - camera_distance * dcos(Player.look_dir) * dcos(Player.look_pitch);
var yto = yfrom + camera_distance * dsin(Player.look_dir) * dcos(Player.look_pitch);
var zto = zfrom + camera_distance * dsin(Player.look_pitch);
*/

var xfrom = sun_x;
var yfrom = sun_y;
var zfrom = sun_z;
var xto = sun_x + sun_dx;
var yto = sun_y + sun_dy;
var zto = sun_z + sun_dz;

// You need to do this AFTER setting the surface target,
// otherwise the camera will be in the wrong place
view_mat = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
//proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), znear, zfar);
proj_mat = matrix_build_projection_ortho(1600, -900, znear, zfar);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

shader_set(shd_depth);
shader_set_uniform_f(shader_get_uniform(shd_basic_3d_stuff, "lightDirection"), sun_dx, sun_dy, sun_dz);

scr_draw_all_the_stuff();

shader_reset();