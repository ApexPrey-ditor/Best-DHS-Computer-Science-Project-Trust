draw_self()

center_text()
draw_set_colour(c_black)
draw_set_font(jack)
draw_text_transformed(x - dsin(image_angle) * 320, y - dcos(image_angle) * 320, "Intermission " + string(global.stage - 1), 4, 4, image_angle)

reset_draw()