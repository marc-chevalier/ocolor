(** XTerm colors *)

(** Get the color code (24 bits) of the given name. [None] if it does not
    exist. Case-insensitive.
*)
val color_of_string: string -> Ocolor_types.rgb option

(** Get the name of a color code (24 bits) [None] if not found.
*)
val string_of_color: Ocolor_types.rgb -> string option

(** Get the id of a given color name. [None] if it does not
    exist. Case-insensitive.
*)
val id_of_color_name: string -> int option

(** Get the name of a xterm color id. [None] if not found.
    The set of valid ids is the range [0; 255].
*)
val color_name_of_id: int -> string option

(** Get the color code (24 bits) of the xterm id. [None] if it does not
    exist.
    The set of valid ids is the range [0; 255].
*)
val color_of_id: int -> Ocolor_types.rgb option

(** Get the id of a color code (24 bits) [None] if not found.
*)
val id_of_color: Ocolor_types.rgb -> int option

(** Set of available colors name, without prefix, or anything.
    The first integer of each tuple is the xterm id.
*)
val available_colors : (int * string * Ocolor_types.rgb) list
