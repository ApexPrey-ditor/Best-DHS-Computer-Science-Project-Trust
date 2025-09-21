draw_set_color(c_blue)
draw_rectangle(room_width - 384, 0, room_width, room_height, false)

reset_draw()

draw_rectangle(room_width - 352, 384, room_width - 224, 512, false)

draw_set_color(c_black)
center_text()
draw_text(room_width - 288, 448, "Gunner")

reset_draw()

draw_rectangle(room_width - 160, 384, room_width - 32, 512, false)

draw_set_color(c_black)
center_text()
draw_text(room_width - 96, 448, "Snipper")