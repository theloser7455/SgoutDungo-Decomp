var m = sigmaid;
var xDist = m.x - x;
var yDist = (m.y + 10) - y;
var chainWidth = sprite_get_width(spr_zapchain);
var chainLength = abs(sqrt(sqr(xDist) + sqr(yDist)));
var chainAngle = degtorad(point_direction(m.x, m.y, x, y));

for (var i = 0; i < chainLength; i += chainWidth)
    draw_sprite_ext(spr_zapchain, 0, m.x + (cos(chainAngle) * i) + ((cos(chainAngle) * chainWidth) / 2), ((m.y + 10) - (sin(chainAngle) * i)) + ((sin(chainAngle) * chainWidth) / 2), 1, 1, radtodeg(chainAngle), c_white, image_alpha);

draw_self();
