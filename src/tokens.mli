(** * tokens of tiger *)
(** ** error line num  *)
type linenum = int;;

(** ** tokens  *)
type token =
  (* keywords *)
  | Type of linenum * linenum
  | Var of linenum * linenum
  | Function of linenum * linenum
  | Break of linenum * linenum
  | Of of linenum * linenum
  | End of linenum * linenum
  | In of linenum * linenum
  | Nil of linenum * linenum
  | Let of linenum * linenum
  | Do of linenum * linenum
  | To of linenum * linenum
  | For of linenum * linenum
  | While of linenum * linenum
  | Else of linenum * linenum
  | Then of linenum * linenum
  | If of linenum * linenum
  | Array of linenum * linenum
  (* operator *)
  | Assign of linenum * linenum
  | Or of linenum * linenum
  | And of linenum * linenum
  | Ge of linenum * linenum
  | Gt of linenum * linenum
  | Le of linenum * linenum
  | Lt of linenum * linenum
  | Neq of linenum * linenum
  | Eq of linenum * linenum
  | Divide of linenum * linenum
  | Times of linenum * linenum
  | Minus of linenum * linenum
  | Plus of linenum * linenum
  (* sign *)
  | Dot of linenum * linenum
  | Rbrace of linenum * linenum
  | Lbrace of linenum * linenum
  | RBrack of linenum * linenum
  | LBrack of linenum * linenum
  | Lparen of linenum * linenum
  | Rparen of linenum * linenum
  | Semicolon of linenum * linenum
  | Colon of linenum * linenum
  | Comma of linenum * linenum
  (* literal *)
  | String of string * linenum * linenum
  | Int of int * linenum * linenum
  (* identifier *)
  | Id of string * linenum * linenum
  (* end of file *)
  | Eof of linenum * linenum;;
