ini_open("settings.ini");

global.sfx_volume = ini_read_real("Audio", "sfx_volume", power(0.5, 0.5));
global.music_volume = ini_read_real("Audio", "music_volume", power(0.5, 0.5));

ini_close();

room_goto(rm_menu)

var _characters = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~¡¢£¤¥¦§¨©ª«¬®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿŒœŠšŸŽž́΄΅Ά·ΈΉΊΌΎΏΐΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΪΫάέήίΰαβγδεζηθικλμνξοπρςστυφχψωϊϋόύώϕЀЁЂЃЄЅІЇЈЉЊЋЌЍЎЏАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяѐёђѓєѕіїјљњћќѝўџѲѳҐґӨөẞ–—‘’‚‛“”„‟•…′″‴‹›‽⁰ⁱ⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾ⁿ₀₁₂₃₄₅₆₇₈₉₊₋₌₍₎€←↑→↓↔↕↖↗↘↙−★☆♡♥♩♪♫♬⚇⛤⛶⸘ﬀﬁﬂﬃﬄﬅﬆ";

global.fnt_bm_small_x4 = font_add_sprite_ext(spr_fnt_small_x4, _characters, true, 8);
global.fnt_bm_small_x4_outline = font_add_sprite_ext(spr_fnt_small_x4_outline, _characters, true, 8);
global.fnt_bm_small_x4_outline_thin = font_add_sprite_ext(spr_fnt_small_x4_outline_thin, _characters, true, 8);
global.fnt_bm_small_x6 = font_add_sprite_ext(spr_fnt_small_x6, _characters, true, 12);
global.fnt_bm_small_x6_outline = font_add_sprite_ext(spr_fnt_small_x6_outline, _characters, true, 12);
global.fnt_bm_small_x6_outline_thin = font_add_sprite_ext(spr_fnt_small_x6_outline_thin, _characters, true, 12);
