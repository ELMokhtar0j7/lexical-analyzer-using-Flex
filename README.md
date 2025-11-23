# Lexical Analyzer using Flex

**BY `Bachir Bouadjera Mohamed Elmokhtar` AND`Chouaki Walid`**

**Under the supervision of Prof. `Sihem Aissaoui`**

Lexical tokenization is the process of converting text into meaningful lexical tokens, each belonging to categories defined by the program.  

This project is a simple **lexer written using Flex**, a tool for generating lexical analyzers based on **regular expressions**. It demonstrates how a lexer can recognize tokens via regex patterns, and is intended for **learning and demonstration purposes**.
## lexer.l
A minimal lexical analyzer for a C-like language. Recognizes:

- **Numbers:** integers & floats (`123`, `45.67`)  
- **Keywords:** `if`, `else`, `while`, `for`, `int`, `float`, `char`, `struct`, `union`, `sizeof`, `include`, `return`  
- **Identifiers:** variables (`x`, `_temp`, `var123`)  
- **String literals:** `"hello"`, `"abc\"def"`  
- **Operators:** `+ - * = == && > <`  
- **Separators:** `; , [ ] { } ( )`  
- **Comments:** single-line (`//...`) & multi-line (`/*...*/`) — ignored  
- **White space:** spaces, tabs, newlines — ignored  

---

## Usage

```bash
# Generate C file from Flex
flex lexer.l

# Compile
gcc lex.yy.c -o lexer -lfl

# Run lexer on your source code
./lexer < code.c
