var _text = "PAUSE";
var _x_start = 200; // Начальная позиция по X
var _y_start = 200; // Начальная позиция по Y
var _radius = 50; // Радиус в пределах которого будет изогнут текст
var _angle_offset = 0; // Смещение угла

for (var i = 0; i < string_length(_text); i++) {
    var char = string_copy(_text, i + 1, 1);
    var angle = angle_offset + (i * (pi / 16)); // Измените значение (pi / 16) для регулировки кривизны
    draw_text(x, y, char);
}