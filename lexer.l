%{
    
#include<stdio.h>
    
%}

DIGIT [0-9]
KEYWORD (else|if|while|for|do|int|float|char|struct|union|sizeof|#include|return)
SEPARATORS (;|,|\[|\]|\{|\}|\(|\))
OPERATORS (==|!=|>=|<=|&&|\+|\-|\*|=|>|<|%)
SPACES [ \t\n\r]+
ID [a-zA-Z_][a-zA-Z0-9_]*
LITERAL_STRING  \"([^\\"]|\\.)*\"
LITERAL_CHAR     \'([^\\']|\\.)*\'
INCLUDE_LIB       \<[a-zA-Z0-9_./]+\>

%% 

{KEYWORD}                       { printf("KEYWORD: %s\n",yytext); }
{INCLUDE_LIB}                   {printf("included library: %s\n",yytext);}
{DIGIT}+("."{DIGIT}+)?          { printf ("NUMBER: %s\n:",yytext); }
{ID}                            { printf("ID: %s\n",yytext); }
"//".*                          { /*single line comment just do nothing (ignore it)*/}
"/\*"([^*]|\*+[^*/])*\*+"/"     {/*multi line comment just do nothing (ignore it)*/}
{SPACES}                        { /* ignore */ }
{OPERATORS}                     { printf("OPERATOR: %s\n", yytext); }
{SEPARATORS}                    { printf("SEPARATOR: %s\n", yytext); }
{LITERAL_STRING}                {printf("literal string: %s\n",yytext); }
{LITERAL_CHAR}                {printf("literal charachter: %s\n",yytext); }
.                               { printf("UNKNOWN: %s\n", yytext); }

%%

int main(void){
    
    yylex();
    return 0;
}