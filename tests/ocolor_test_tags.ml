open OUnit

open Ocolor_format

open Ocolor_test_lib

let _test_tags : test =
    let test_cases : (string * (Format.formatter -> unit) * string) list = [
      "x11_maroon", (fun fmt -> Format.fprintf fmt "a@{<x11_maroon>b@}c"), "a"^ ~>[38;2;176;48;96]^"b"^ ~>[39]^"c";
      "x11:maroon", (fun fmt -> Format.fprintf fmt "a@{<x11:maroon>b@}c"), "a"^ ~>[38;2;176;48;96]^"b"^ ~>[39]^"c";
      "xterm_DarkOliveGreen3", (fun fmt -> Format.fprintf fmt "a@{<xterm_DarkOliveGreen3>b@}c"), "a"^ ~>[38;2;175;215;95]^"b"^ ~>[39]^"c";
      "xterm:DarkOliveGreen3", (fun fmt -> Format.fprintf fmt "a@{<xterm:DarkOliveGreen3>b@}c"), "a"^ ~>[38;2;175;215;95]^"b"^ ~>[39]^"c";
      "xterm:Maroon", (fun fmt -> Format.fprintf fmt "a@{<xterm:Maroon>b@}c"), "a"^ ~>[38;2;128;0;0]^"b"^ ~>[39]^"c";
      "xterm:maroon", (fun fmt -> Format.fprintf fmt "a@{<xterm:maroon>b@}c"), "a"^ ~>[38;2;128;0;0]^"b"^ ~>[39]^"c";
      "xterm:1", (fun fmt -> Format.fprintf fmt "a@{<xterm:1>b@}c"), "a"^ ~>[38;2;128;0;0]^"b"^ ~>[39]^"c";
      "xterm:01", (fun fmt -> Format.fprintf fmt "a@{<xterm:01>b@}c"), "a"^ ~>[38;2;128;0;0]^"b"^ ~>[39]^"c";
      "xterm:0x1", (fun fmt -> Format.fprintf fmt "a@{<xterm:0x1>b@}c"), "a"^ ~>[38;2;128;0;0]^"b"^ ~>[39]^"c";
      "xterm:0x01", (fun fmt -> Format.fprintf fmt "a@{<xterm:0x01>b@}c"), "a"^ ~>[38;2;128;0;0]^"b"^ ~>[39]^"c";
      "css_gray", (fun fmt -> Format.fprintf fmt "a@{<css_gray>b@}c"), "a"^ ~>[38;2;128;128;128]^"b"^ ~>[39]^"c";
      "css:gray", (fun fmt -> Format.fprintf fmt "a@{<css:gray>b@}c"), "a"^ ~>[38;2;128;128;128]^"b"^ ~>[39]^"c";
      "rgb", (fun fmt -> Format.fprintf fmt "a@{<rgb(1,2,3)>b@}c"), "a"^ ~>[38;2;1;2;3]^"b"^ ~>[39]^"c";
      "rgb spaces", (fun fmt -> Format.fprintf fmt "a@{<rgb(1, 2, 3)>b@}c"), "a"^ ~>[38;2;1;2;3]^"b"^ ~>[39]^"c";
      "rgb invalid", (fun fmt -> Format.fprintf fmt "a@{<rgb(1,2,300)>b@}c"), "abc";
      "rgb invalid nested", (fun fmt -> Format.fprintf fmt "x@{<rgb(1,2,3)>a@{<rgb(1,2,300)>b@}c@}y"), "x"^ ~>[38;2;1;2;3]^"abc"^ ~>[39]^"y";
      "rgb hexa", (fun fmt -> Format.fprintf fmt "a@{<rgb(0x80,0x80,0x80)>b@}c"), "a"^ ~>[38;2;128;128;128]^"b"^ ~>[39]^"c";
      "rgb hexa spaces", (fun fmt -> Format.fprintf fmt "a@{<rgb(0x80, 0x80,   0x80)>b@}c"), "a"^ ~>[38;2;128;128;128]^"b"^ ~>[39]^"c";
      "greyscale", (fun fmt -> Format.fprintf fmt "a@{<gs(12)>b@}c"), "a"^ ~>[38;5;244]^"b"^ ~>[39]^"c";
      "c6", (fun fmt -> Format.fprintf fmt "a@{<c6(1,2,3)>b@}c"), "a"^ ~>[38;5;67]^"b"^ ~>[39]^"c";
      "c6 spaces", (fun fmt -> Format.fprintf fmt "a@{<c6(1, 2, 3)>b@}c"), "a"^ ~>[38;5;67]^"b"^ ~>[39]^"c";
    ]
    in
    let test (name, f, standard : string * (Format.formatter -> unit) * string) : test =
      let case () =
        assert_equal
          ~cmp:(fun x y -> String.compare x y = 0)
          ~printer:(fun x -> x)
          ~pp_diff:(fun fmt (a, b) -> Format.fprintf fmt "%s != %s" (make_sgr_visible a) (make_sgr_visible b))
          standard
          (asprintf "%t" f)
      in
      name >:: case
    in
    "pair" >::: List.map test test_cases

let test_tags : test =
  let suite =
    "tags" >::: [
      _test_tags;
    ]
  in
  suite