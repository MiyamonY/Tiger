/* header */
{
  open Tokens;;
	
  type pos = int;;
	
  let keywords =
	[("type", Type);
	 ("var", Var);
	 ("function", Function);
	 ("break", Break);
	 ("of", Of);
	 ("end", End);
	 ("in", In);
	 ("nil", Nil);
	 ("let", Let);
	 ("do", Do);
	 ("to", To);
	 ("for", For);
	 ("while", While);
	 ("else", Else);
	 ("then", Then);
	 ("if", If);
	 ("array", Array);]
}
  
  
rule main =
parse
 | "\n"
 |

/* trailer */
{
  
}
