variable.l: 
%{ 
#include "y.tab.h" 
%} 
%% 
[a-zA-Z_][a-zA-Z_0-9]* return letter; 
[0-9] return digit; 
. return yytext[0]; 
\n return 0; 
 
%% 
int yywrap(){ 
return 1; 
}
 
variable.y: 
%{ 
#include<stdio.h> 
int valid=1; 
%} 
%token digit letter 
%% 
start : letter s 
s : letter s 
| digit s 
| 
; 
%% 
int yyerror() 
{ 
printf("\nIts not an identifier!\n"); 
valid=0; 
return 0; 
} 
int main() { 
printf("\nEnter a name to test for an identifier: "); 
yyparse(); 
if(valid) { 
printf("\nIt is an identifier!\n"); 
} }
