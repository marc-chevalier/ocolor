type rgb = Ocolor_types.rgb

let available_colors : (int * string * rgb) list =
  [
    0, "Black", (0, 0, 0);
    1, "Maroon", (128, 0, 0);
    2, "Green", (0, 128, 0);
    3, "Olive", (128, 128, 0);
    4, "Navy", (0, 0, 128);
    5, "Purple", (128, 0, 128);
    6, "Teal", (0, 128, 128);
    7, "Silver", (192, 192, 192);
    8, "Grey", (128, 128, 128);
    9, "Red", (255, 0, 0);
    10, "Lime", (0, 255, 0);
    11, "Yellow", (255, 255, 0);
    12, "Blue", (0, 0, 255);
    13, "Fuchsia", (255, 0, 255);
    14, "Aqua", (0, 255, 255);
    15, "White", (255, 255, 255);
    16, "Grey0", (0, 0, 0);
    17, "NavyBlue", (0, 0, 95);
    18, "DarkBlue", (0, 0, 135);
    19, "Blue3", (0, 0, 175);
    20, "Blue3", (0, 0, 215);
    21, "Blue1", (0, 0, 255);
    22, "DarkGreen", (0, 95, 0);
    23, "DeepSkyBlue4", (0, 95, 95);
    24, "DeepSkyBlue4", (0, 95, 135);
    25, "DeepSkyBlue4", (0, 95, 175);
    26, "DodgerBlue3", (0, 95, 215);
    27, "DodgerBlue2", (0, 95, 255);
    28, "Green4", (0, 135, 0);
    29, "SpringGreen4", (0, 135, 95);
    30, "Turquoise4", (0, 135, 135);
    31, "DeepSkyBlue3", (0, 135, 175);
    32, "DeepSkyBlue3", (0, 135, 215);
    33, "DodgerBlue1", (0, 135, 255);
    34, "Green3", (0, 175, 0);
    35, "SpringGreen3", (0, 175, 95);
    36, "DarkCyan", (0, 175, 135);
    37, "LightSeaGreen", (0, 175, 175);
    38, "DeepSkyBlue2", (0, 175, 215);
    39, "DeepSkyBlue1", (0, 175, 255);
    40, "Green3", (0, 215, 0);
    41, "SpringGreen3", (0, 215, 95);
    42, "SpringGreen2", (0, 215, 135);
    43, "Cyan3", (0, 215, 175);
    44, "DarkTurquoise", (0, 215, 215);
    45, "Turquoise2", (0, 215, 255);
    46, "Green1", (0, 255, 0);
    47, "SpringGreen2", (0, 255, 95);
    48, "SpringGreen1", (0, 255, 135);
    49, "MediumSpringGreen", (0, 255, 175);
    50, "Cyan2", (0, 255, 215);
    51, "Cyan1", (0, 255, 255);
    52, "DarkRed", (95, 0, 0);
    53, "DeepPink4", (95, 0, 95);
    54, "Purple4", (95, 0, 135);
    55, "Purple4", (95, 0, 175);
    56, "Purple3", (95, 0, 215);
    57, "BlueViolet", (95, 0, 255);
    58, "Orange4", (95, 95, 0);
    59, "Grey37", (95, 95, 95);
    60, "MediumPurple4", (95, 95, 135);
    61, "SlateBlue3", (95, 95, 175);
    62, "SlateBlue3", (95, 95, 215);
    63, "RoyalBlue1", (95, 95, 255);
    64, "Chartreuse4", (95, 135, 0);
    65, "DarkSeaGreen4", (95, 135, 95);
    66, "PaleTurquoise4", (95, 135, 135);
    67, "SteelBlue", (95, 135, 175);
    68, "SteelBlue3", (95, 135, 215);
    69, "CornflowerBlue", (95, 135, 255);
    70, "Chartreuse3", (95, 175, 0);
    71, "DarkSeaGreen4", (95, 175, 95);
    72, "CadetBlue", (95, 175, 135);
    73, "CadetBlue", (95, 175, 175);
    74, "SkyBlue3", (95, 175, 215);
    75, "SteelBlue1", (95, 175, 255);
    76, "Chartreuse3", (95, 215, 0);
    77, "PaleGreen3", (95, 215, 95);
    78, "SeaGreen3", (95, 215, 135);
    79, "Aquamarine3", (95, 215, 175);
    80, "MediumTurquoise", (95, 215, 215);
    81, "SteelBlue1", (95, 215, 255);
    82, "Chartreuse2", (95, 255, 0);
    83, "SeaGreen2", (95, 255, 95);
    84, "SeaGreen1", (95, 255, 135);
    85, "SeaGreen1", (95, 255, 175);
    86, "Aquamarine1", (95, 255, 215);
    87, "DarkSlateGray2", (95, 255, 255);
    88, "DarkRed", (135, 0, 0);
    89, "DeepPink4", (135, 0, 95);
    90, "DarkMagenta", (135, 0, 135);
    91, "DarkMagenta", (135, 0, 175);
    92, "DarkViolet", (135, 0, 215);
    93, "Purple", (135, 0, 255);
    94, "Orange4", (135, 95, 0);
    95, "LightPink4", (135, 95, 95);
    96, "Plum4", (135, 95, 135);
    97, "MediumPurple3", (135, 95, 175);
    98, "MediumPurple3", (135, 95, 215);
    99, "SlateBlue1", (135, 95, 255);
    100, "Yellow4", (135, 135, 0);
    101, "Wheat4", (135, 135, 95);
    102, "Grey53", (135, 135, 135);
    103, "LightSlateGrey", (135, 135, 175);
    104, "MediumPurple", (135, 135, 215);
    105, "LightSlateBlue", (135, 135, 255);
    106, "Yellow4", (135, 175, 0);
    107, "DarkOliveGreen3", (135, 175, 95);
    108, "DarkSeaGreen", (135, 175, 135);
    109, "LightSkyBlue3", (135, 175, 175);
    110, "LightSkyBlue3", (135, 175, 215);
    111, "SkyBlue2", (135, 175, 255);
    112, "Chartreuse2", (135, 215, 0);
    113, "DarkOliveGreen3", (135, 215, 95);
    114, "PaleGreen3", (135, 215, 135);
    115, "DarkSeaGreen3", (135, 215, 175);
    116, "DarkSlateGray3", (135, 215, 215);
    117, "SkyBlue1", (135, 215, 255);
    118, "Chartreuse1", (135, 255, 0);
    119, "LightGreen", (135, 255, 95);
    120, "LightGreen", (135, 255, 135);
    121, "PaleGreen1", (135, 255, 175);
    122, "Aquamarine1", (135, 255, 215);
    123, "DarkSlateGray1", (135, 255, 255);
    124, "Red3", (175, 0, 0);
    125, "DeepPink4", (175, 0, 95);
    126, "MediumVioletRed", (175, 0, 135);
    127, "Magenta3", (175, 0, 175);
    128, "DarkViolet", (175, 0, 215);
    129, "Purple", (175, 0, 255);
    130, "DarkOrange3", (175, 95, 0);
    131, "IndianRed", (175, 95, 95);
    132, "HotPink3", (175, 95, 135);
    133, "MediumOrchid3", (175, 95, 175);
    134, "MediumOrchid", (175, 95, 215);
    135, "MediumPurple2", (175, 95, 255);
    136, "DarkGoldenrod", (175, 135, 0);
    137, "LightSalmon3", (175, 135, 95);
    138, "RosyBrown", (175, 135, 135);
    139, "Grey63", (175, 135, 175);
    140, "MediumPurple2", (175, 135, 215);
    141, "MediumPurple1", (175, 135, 255);
    142, "Gold3", (175, 175, 0);
    143, "DarkKhaki", (175, 175, 95);
    144, "NavajoWhite3", (175, 175, 135);
    145, "Grey69", (175, 175, 175);
    146, "LightSteelBlue3", (175, 175, 215);
    147, "LightSteelBlue", (175, 175, 255);
    148, "Yellow3", (175, 215, 0);
    149, "DarkOliveGreen3", (175, 215, 95);
    150, "DarkSeaGreen3", (175, 215, 135);
    151, "DarkSeaGreen2", (175, 215, 175);
    152, "LightCyan3", (175, 215, 215);
    153, "LightSkyBlue1", (175, 215, 255);
    154, "GreenYellow", (175, 255, 0);
    155, "DarkOliveGreen2", (175, 255, 95);
    156, "PaleGreen1", (175, 255, 135);
    157, "DarkSeaGreen2", (175, 255, 175);
    158, "DarkSeaGreen1", (175, 255, 215);
    159, "PaleTurquoise1", (175, 255, 255);
    160, "Red3", (215, 0, 0);
    161, "DeepPink3", (215, 0, 95);
    162, "DeepPink3", (215, 0, 135);
    163, "Magenta3", (215, 0, 175);
    164, "Magenta3", (215, 0, 215);
    165, "Magenta2", (215, 0, 255);
    166, "DarkOrange3", (215, 95, 0);
    167, "IndianRed", (215, 95, 95);
    168, "HotPink3", (215, 95, 135);
    169, "HotPink2", (215, 95, 175);
    170, "Orchid", (215, 95, 215);
    171, "MediumOrchid1", (215, 95, 255);
    172, "Orange3", (215, 135, 0);
    173, "LightSalmon3", (215, 135, 95);
    174, "LightPink3", (215, 135, 135);
    175, "Pink3", (215, 135, 175);
    176, "Plum3", (215, 135, 215);
    177, "Violet", (215, 135, 255);
    178, "Gold3", (215, 175, 0);
    179, "LightGoldenrod3", (215, 175, 95);
    180, "Tan", (215, 175, 135);
    181, "MistyRose3", (215, 175, 175);
    182, "Thistle3", (215, 175, 215);
    183, "Plum2", (215, 175, 255);
    184, "Yellow3", (215, 215, 0);
    185, "Khaki3", (215, 215, 95);
    186, "LightGoldenrod2", (215, 215, 135);
    187, "LightYellow3", (215, 215, 175);
    188, "Grey84", (215, 215, 215);
    189, "LightSteelBlue1", (215, 215, 255);
    190, "Yellow2", (215, 255, 0);
    191, "DarkOliveGreen1", (215, 255, 95);
    192, "DarkOliveGreen1", (215, 255, 135);
    193, "DarkSeaGreen1", (215, 255, 175);
    194, "Honeydew2", (215, 255, 215);
    195, "LightCyan1", (215, 255, 255);
    196, "Red1", (255, 0, 0);
    197, "DeepPink2", (255, 0, 95);
    198, "DeepPink1", (255, 0, 135);
    199, "DeepPink1", (255, 0, 175);
    200, "Magenta2", (255, 0, 215);
    201, "Magenta1", (255, 0, 255);
    202, "OrangeRed1", (255, 95, 0);
    203, "IndianRed1", (255, 95, 95);
    204, "IndianRed1", (255, 95, 135);
    205, "HotPink", (255, 95, 175);
    206, "HotPink", (255, 95, 215);
    207, "MediumOrchid1", (255, 95, 255);
    208, "DarkOrange", (255, 135, 0);
    209, "Salmon1", (255, 135, 95);
    210, "LightCoral", (255, 135, 135);
    211, "PaleVioletRed1", (255, 135, 175);
    212, "Orchid2", (255, 135, 215);
    213, "Orchid1", (255, 135, 255);
    214, "Orange1", (255, 175, 0);
    215, "SandyBrown", (255, 175, 95);
    216, "LightSalmon1", (255, 175, 135);
    217, "LightPink1", (255, 175, 175);
    218, "Pink1", (255, 175, 215);
    219, "Plum1", (255, 175, 255);
    220, "Gold1", (255, 215, 0);
    221, "LightGoldenrod2", (255, 215, 95);
    222, "LightGoldenrod2", (255, 215, 135);
    223, "NavajoWhite1", (255, 215, 175);
    224, "MistyRose1", (255, 215, 215);
    225, "Thistle1", (255, 215, 255);
    226, "Yellow1", (255, 255, 0);
    227, "LightGoldenrod1", (255, 255, 95);
    228, "Khaki1", (255, 255, 135);
    229, "Wheat1", (255, 255, 175);
    230, "Cornsilk1", (255, 255, 215);
    231, "Grey100", (255, 255, 255);
    232, "Grey3", (8, 8, 8);
    233, "Grey7", (18, 18, 18);
    234, "Grey11", (28, 28, 28);
    235, "Grey15", (38, 38, 38);
    236, "Grey19", (48, 48, 48);
    237, "Grey23", (58, 58, 58);
    238, "Grey27", (68, 68, 68);
    239, "Grey30", (78, 78, 78);
    240, "Grey35", (88, 88, 88);
    241, "Grey39", (98, 98, 98);
    242, "Grey42", (108, 108, 108);
    243, "Grey46", (118, 118, 118);
    244, "Grey50", (128, 128, 128);
    245, "Grey54", (138, 138, 138);
    246, "Grey58", (148, 148, 148);
    247, "Grey62", (158, 158, 158);
    248, "Grey66", (168, 168, 168);
    249, "Grey70", (178, 178, 178);
    250, "Grey74", (188, 188, 188);
    251, "Grey78", (198, 198, 198);
    252, "Grey82", (208, 208, 208);
    253, "Grey85", (218, 218, 218);
    254, "Grey89", (228, 228, 228);
    255, "Grey93", (238, 238, 238);
  ]

module StringMap = Map.Make(String)
module IntMap = Map.Make(struct type t = int let compare = compare end)
module RGBMap = Map.Make(struct type t = rgb let compare = compare end)

let lowercase =
#if OCAML_VERSION >= (4, 03, 0)
  String.lowercase_ascii
#else
  String.lowercase
#endif

let of_string_map : (int * rgb) StringMap.t =
  List.fold_left
    (fun acc (id, s, rgb) -> StringMap.add (lowercase s) (id, rgb) acc)
    StringMap.empty
    available_colors

let of_color_map : (int * string) RGBMap.t =
  List.fold_left
    (fun acc (id, s, rgb) -> RGBMap.add rgb (id, s) acc)
    RGBMap.empty
    available_colors

let of_int_map : (string * rgb) IntMap.t =
  List.fold_left
    (fun acc (id, s, rgb) -> IntMap.add id (s, rgb) acc)
    IntMap.empty
    available_colors

let color_of_string (s: string) : rgb option =
  try
    Some (snd (StringMap.find (lowercase s) of_string_map))
  with Not_found -> None

let string_of_color (c: rgb) : string option =
  try
    Some (snd (RGBMap.find c of_color_map))
  with Not_found -> None

let id_of_color_name (s: string) : int option =
  try
    Some (fst (StringMap.find (lowercase s) of_string_map))
  with Not_found -> None

let color_name_of_id (id: int) : string option =
  try
    Some (fst (IntMap.find id of_int_map))
  with Not_found -> None

let color_of_id (id: int) : rgb option =
  try
    Some (snd (IntMap.find id of_int_map))
  with Not_found -> None

let id_of_color (c: Ocolor_types.rgb) : int option =
  try
    Some (fst (RGBMap.find c of_color_map))
  with Not_found -> None