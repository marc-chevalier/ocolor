module type PRETTY_PRINTERS =
  (sig
    type formatter
    type 'a pp = formatter -> 'a -> unit

    (** Pretty print a bool. Useful with %a. It displays boolean as %b but with
        styles.
        [false_style] defaults to
        [[Ocolor_types.Bold;Ocolor_types.Fg (C4 Ocolor_values.red)]] (ie. red and
        bold) and [true_style] defaults to
        [[Ocolor_types.Bold;Ocolor_types.Fg (C4 Ocolor_values.green)]] (ie. green and
        bold). *)
    val pp_bool_generic:
      ?false_style:Ocolor_types.style list ->
      ?true_style:Ocolor_types.style list ->
      bool pp

    (** Like {!pp_bool_generic} with default settings *)
    val pp_bool: bool pp

    (** Pretty print an option. Useful with %a.
        Default settings:
        - [none] = ["None"]
        - [none_style] = [Ocolor_types.[Faint]]
        - [some_style] = [[]]
        - [some_format] = ["%a%a%a"]
        - [none_format] = ["%a%s%a"]

        Moreover, it need a (pretty) printer that prints the content of the option.

        When the option is [None], it print using [none_format] applied
        to [pp_open_styles], [none_style], [none], [pp_close_styles] and [()].
        When the option is [Some a], it print using [some_format] applied
        to [pp_open_styles], [none_style], [p], [a], [pp_close_styles] and [()]
        where [p] is the provided printer.
        It allow customizing the output like Using ["Some(%a%a%a)"] or
        ["%aSome(%a)%a"] as format.
    *)
    val pp_option_more_generic:
      ?none:string ->
      ?none_style:Ocolor_types.style list ->
      ?some_style:Ocolor_types.style list ->
      ?some_format:(Ocolor_types.style list pp -> Ocolor_types.style list ->
                    'a pp -> 'a ->
                    unit pp -> unit -> unit,
                    formatter, unit, unit, unit, unit)
          format6 ->
      ?none_format:(Ocolor_types.style list pp ->
                    Ocolor_types.style list ->
                    string ->
                    unit pp -> unit -> unit,
                    formatter, unit, unit, unit, unit)
          format6 ->
      'a pp -> 'a option pp

    (** Pretty print an option. Useful with %a.
        Default settings:
        - [none] = ["None"]
        - [none_style] = [Ocolor_types.[Faint]]
        - [some_style] = [[]]

        Moreover, it need a (pretty) printer that prints the content of the option.

        It prints [none] when the option is [None] with the style [none_style], and
        [p a] where [p] is the printer and the option is [Some a]. In particular, it
        does not display "Some" or something like that.
    *)
    val pp_option_generic:
      ?none:string ->
      ?none_style:Ocolor_types.style list ->
      ?some_style:Ocolor_types.style list ->
      'a pp -> 'a option pp

    (** Like {!pp_option_generic} with default settings *)
    val pp_option: 'a pp -> 'a option pp

#if OCAML_VERSION >= (4, 03, 0)
    val pp_result_more_generic:
      ?ok_style:Ocolor_types.style list ->
      ?error_style:Ocolor_types.style list ->
      ?ok_format:(Ocolor_types.style list pp ->
                  Ocolor_types.style list ->
                  'a pp ->
                  'a -> unit pp -> unit -> unit,
                  formatter, unit, unit, unit, unit)
          format6 ->
      ?error_format:(Ocolor_types.style list pp ->
                     Ocolor_types.style list ->
                     'b pp ->
                     'b -> unit pp -> unit -> unit,
                     formatter, unit, unit, unit, unit)
          format6 ->
      'a pp -> 'b pp -> ('a, 'b) result pp
    val pp_result_generic:
      ?ok_style:Ocolor_types.style list ->
      ?error_style:Ocolor_types.style list ->
      'a pp -> 'b pp -> ('a, 'b) result pp
    val pp_result: 'a pp -> 'b pp -> ('a, 'b) result pp
#endif

    (** Pretty print a pair. Useful with %a.
        Default settings:
        - [left] = ["("]
        - [sep] = [", "]
        - [right] = [")"]
        - [delim_style] = [Ocolor_types.[Faint]]
        - [sep_style] = [Ocolor_types.[Faint]]
        - [elem_style] = [[]]

        Moreover, it need two (pretty) printers that prints each part of the pair.

        [delim_style] is applied to [left] and [right], [sep_style] is applied to
        [sep] and [elem_style] is applied to each element. In particular, the pretty
        printer will work in the context set by [elem_style], so it does not need to
        apply the same style once again (however, it is harmless).
    *)
    val pp_pair_generic:
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?elem_style:Ocolor_types.style list ->
      'a pp -> 'b pp -> ('a * 'b) pp

    (** Like {!pp_pair_generic} with default settings *)
    val pp_pair: 'a pp -> 'b pp -> ('a * 'b) pp

    val pp_3_tuple_generic:
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?elem_style:Ocolor_types.style list ->
      'a pp -> 'b pp -> 'c pp -> ('a * 'b * 'c) pp

    (** Like {!pp_3_tuple_generic} with default settings *)
    val pp_3_tuple: 'a pp -> 'b pp -> 'c pp -> ('a * 'b * 'c) pp

    val pp_4_tuple_generic:
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?elem_style:Ocolor_types.style list ->
      'a pp -> 'b pp -> 'c pp -> 'd pp -> ('a * 'b * 'c * 'd) pp

    (** Like {!pp_4_tuple_generic} with default settings *)
    val pp_4_tuple: 'a pp -> 'b pp -> 'c pp -> 'd pp -> ('a * 'b * 'c * 'd) pp

    val pp_5_tuple_generic:
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?elem_style:Ocolor_types.style list ->
      'a pp -> 'b pp -> 'c pp -> 'd pp -> 'e pp -> ('a * 'b * 'c * 'd * 'e) pp

    (** Like {!pp_5_tuple_generic} with default settings *)
    val pp_5_tuple: 'a pp -> 'b pp -> 'c pp -> 'd pp -> 'e pp -> ('a * 'b * 'c * 'd * 'e) pp

    (** Print an iterable list-like or set-like data structure, that is a collection
        with an iter function whose callback will expect one parameter.
        Default settings:
        - [left] = ["{"]
        - [sep] = ["; "]
        - [right] = ["}"]
        - [empty]: None
        - [delim_style] = [Ocolor_types.[Faint]]
        - [sep_style] = [Ocolor_types.[Faint]]
        - [elem_style] = [[]]
        - [empty_style] = [[]]

        It expects an iter function over the collection and a (pretty) printer for
        elements of the collection.

        [delim_style] is applied to [left] and [right], [sep_style] is applied to
        [sep] and [elem_style] is applied to each element. In particular, the pretty
        printer will work in the context set by [elem_style], so it does not need to
        apply the same style once again (however, it is harmless).

        If [empty] is provided and the collection is empty, rather than printing
        [left][right], [empty] will be printed instead, with style [empty_style].

        Otherwise, [left] is printed, followed by the [sep]-separated list of the
        elements on which the iter function calls its callback (in the same order),
        followed by [right].
    *)
    val pp_iterable_generic:
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?empty:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?elem_style:Ocolor_types.style list ->
      ?empty_style:Ocolor_types.style list ->
      (('a -> unit) -> 'b -> unit) ->
      'a pp -> 'b pp

    (** Default version of pp_iterable_generic *)
    val pp_iterable: (('a -> unit) -> 'b -> unit) -> 'a pp -> 'b pp

    (** Pretty print a list. Useful with %a.
        Default settings:
        - [left] = ["\["]
        - [sep] = ["; "]
        - [right] = ["\]"]
        - [empty]: None
        - [delim_style] = [Ocolor_types.[Faint]]
        - [sep_style] = [Ocolor_types.[Faint]]
        - [elem_style] = [[]]
        - [empty_style] = [[]]

        Moreover, it need a (pretty) printer that prints an element

        With default settings, if the list is empty it prints "[]". If the list
        contains only one element [a], it prints "[a]". Otherwise, elements are
        separated by "; " without final separator, for instance "[a; b; c]".

        [delim_style] is applied to [left] and [right], [sep_style] is applied to
        [sep] and [elem_style] is applied to each element. In particular, the pretty
        printer will work in the context set by [elem_style], so it does not need to
        apply the same style once again (however, it is harmless).

        If [empty] is provided and the list is empty, rather than printing
        [left][right], [empty] will be printed instead, with style [empty_style].
    *)
    val pp_list_generic:
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?empty:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?elem_style:Ocolor_types.style list ->
      ?empty_style:Ocolor_types.style list ->
      'a pp -> 'a list pp

    (** Like {!pp_list_generic} with default settings *)
    val pp_list: 'a pp -> 'a list pp


    (** Pretty print an array. Useful with %a.
        Default settings:
        - [left] = ["\["]
        - [sep] = ["; "]
        - [right] = ["\]"]
        - [empty]: None
        - [delim_style] = [Ocolor_types.[Faint]]
        - [sep_style] = [Ocolor_types.[Faint]]
        - [elem_style] = [[]]
        - [empty_style] = [[]]

        Moreover, it need a (pretty) printer that prints an element

        With default settings, if the array is empty it prints "[]". If the array
        contains only one element [a], it prints "[a]". Otherwise, elements are
        separated by "; " without final separator, for instance "[a; b; c]"

        [delim_style] is applied to [left] and [right], [sep_style] is applied to
        [sep] and [elem_style] is applied to each element. In particular, the pretty
        printer will work in the context set by [elem_style], so it does not need to
        apply the same style once again (however, it is harmless).

        If [empty] is provided and the array is empty, rather than printing
        [left][right], [empty] will be printed instead, with style [empty_style].
    *)
    val pp_array_generic:
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?empty:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?elem_style:Ocolor_types.style list ->
      ?empty_style:Ocolor_types.style list ->
      'a pp -> 'a array pp

    (** Like {!pp_array_generic} with default settings *)
    val pp_array: 'a pp -> 'a array pp

    (** Print an iterable map-like data structure, that is a collection
        with an iter function whose callback will expect two parameters.
        Default settings:
        - [left] = ["{"]
        - [sep] = ["; "]
        - [right] = ["}"]
        - [empty]: None
        - [delim_style] = [Ocolor_types.[Faint]]
        - [sep_style] = [Ocolor_types.[Faint]]
        - [empty_style] = [[]]

        It expects an iter function over the collection and a (pretty) printer for
        key-value pairs of the collection.

        [delim_style] is applied to [left] and [right] and [sep_style] is applied
        to [sep].

        If [empty] is provided and the collection is empty, rather than printing
        [left][right], [empty] will be printed instead, with style [empty_style].

        Otherwise, [left] is printed, followed by the [sep]-separated list of the
        elements on which the iter function calls its callback (in the same order),
        followed by [right].
    *)
    val pp_iterable_mapping_more_generic :
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?empty:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?empty_style:Ocolor_types.style list ->
      (('a -> 'b -> unit) -> 'c -> unit) ->
      ('a * 'b) pp -> 'c pp

    (** Print an iterable map-like data structure as a sequence of
        <key><mapsto><value> separated by <sep>.
        Default settings:
        - [left] = ["{"]
        - [sep] = ["; "]
        - [right] = ["}"]
        - [mapsto] = [":"]
        - [empty]: None
        - [delim_style] = [Ocolor_types.[Faint]]
        - [sep_style] = [Ocolor_types.[Faint]]
        - [mapsto_style] = [Ocolor_types.[Faint]]
        - [key_style] = [[]]
        - [value_style] = [[]]
        - [empty_style] = [[]]

        It expects an iter function over the collection, a (pretty) printer for keys
        and a (pretty) printer for values of the collection.

        See {!pp_iterable_mapping_more_generic} for more details.
    *)
    val pp_iterable_mapping_generic :
      ?left:string ->
      ?sep:string ->
      ?right:string ->
      ?mapsto:string ->
      ?empty:string ->
      ?delim_style:Ocolor_types.style list ->
      ?sep_style:Ocolor_types.style list ->
      ?mapsto_style:Ocolor_types.style list ->
      ?key_style:Ocolor_types.style list ->
      ?value_style:Ocolor_types.style list ->
      ?empty_style:Ocolor_types.style list ->
      (('a -> 'b -> unit) -> 'c -> unit) ->
      'a pp -> 'b pp -> 'c pp

    (** Default version of {!pp_iterable_mapping_generic} *)
    val pp_iterable_mapping :
      (('a -> 'b -> unit) -> 'c -> unit) ->
      'a pp -> 'b pp -> 'c pp
  end)

module BuildPrettyPrinters
    (PP : sig
       type formatter
       val fprintf : formatter -> ('a, formatter, unit) format -> 'a
       val pp_open_styles : formatter -> Ocolor_types.style list -> unit
       val pp_close_styles : formatter -> unit -> unit
     end)
  : PRETTY_PRINTERS
  with type formatter := PP.formatter
