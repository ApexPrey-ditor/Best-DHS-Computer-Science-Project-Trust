// draw a grey circle that corresponds to the towers range

draw_set_alpha(0.5)
draw_set_color(c_grey)
draw_circle(x, y, range, false)

reset_draw()

draw_self()