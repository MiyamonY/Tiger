(** error message  *)
exception Error;;
  
val reset : unit -> unit;;
  
val set_file : string -> unit;;
  
val incr_linepos : unit -> unit;;

val add_linepos : int -> unit;;
  
val error : Tokens.linenum -> string -> unit;;

val impossible : string -> 'a;; (* raise Error *)

  
	
  
