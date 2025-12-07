if (global.waveTransition or image_alpha != 0.5) {
	image_alpha -= 1/120
}

if (image_alpha <= 0) {
	instance_destroy()
}