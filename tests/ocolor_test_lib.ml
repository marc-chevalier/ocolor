open Ocolor_types
open Ocolor_sgr


let sgr_regex : Str.regexp =
  Str.regexp "\x1b\\[\\([0-9;]*\\)m"

let make_sgr_visible (s: string) : string =
  let placeholder = (sgr_of_style (Fg (C4 hi_green)))^"\\1:"^(sgr_of_style Reset) in
  let template = placeholder in
  Str.global_replace sgr_regex template s

let (~>) = sgr_of_seq

let sgr_of_seqs (l: seq list) : string =
  l |> List.map (~>) |> String.concat ""

let (~~>) = sgr_of_seqs
