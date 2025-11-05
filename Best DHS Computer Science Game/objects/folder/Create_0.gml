direction = -90
image_angle = 180

image_xscale = 24
image_yscale = 24

instance_create_layer(x - 512, y - 32, "Selections", card, {image_xscale : 12, image_yscale : 12, image_angle : -120})
instance_create_layer(x, y, "Selections", card, {image_xscale : 12, image_yscale : 12, image_angle : -190})
instance_create_layer(x + 512, y + 16, "Selections", card, {image_xscale : 12, image_yscale : 12, image_angle : -210})