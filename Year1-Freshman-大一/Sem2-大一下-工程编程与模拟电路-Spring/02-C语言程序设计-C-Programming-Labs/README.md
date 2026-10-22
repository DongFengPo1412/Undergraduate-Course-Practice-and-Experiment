# C Programming Labs (C语言实验)

This repository contains the academic portfolio for the course **C Programming Labs (C语言实验)**, completed by **Chaoran Liu (刘超然)**. 

The portfolio showcases a complete set of fundamental and advanced software engineering exercises in the C programming language, spanning basic syntax, control structures, arrays, modular functions, pointers, and user-defined structure types (`struct`).

---

## Portfolio Directory Structure

```
C-Programming-Labs/
│
├── README.md                                 # This document
│
├── src/                                      # C language source files
│   ├── C_Course_Exercises.c                  # Grammar, selections, loops, and array exercises
│   ├── ch9_Structs_Average.c                 # Struct arrays and average score calculations
│   └── ch10_Scores_Management.c              # Struct pointers and score queries
│
└── docs/                                     # PDF Laboratory Reports
    ├── Lab_Report_1_Basic_Structures.pdf     # Lab 1: Sequence, branch, and loop structures
    ├── Lab_Report_2_Arrays.pdf               # Lab 2: Multi-dimensional arrays
    ├── Lab_Report_3_Functions.pdf            # Lab 3: User-defined functions and parameters
    └── Lab_Report_4_Structures.pdf           # Lab 4: Structure data types and arrays
```

---

## 1. Core Programming Topics

All programming projects are categorized into four core laboratory phases, matching the source code implementations in src/ (referenced resource not located in this archive) and detailed documentation in docs/ (referenced resource not located in this archive).

### A. Basic Control Structures (顺序、分支与循环结构)
*   **Concepts**: Sequence executions; conditional branching using `if-else` and `switch-case` blocks; iterative loops using `for`, `while`, and `do-while` structures.
*   **Implementation**: Covered in the comprehensive code bank C_Course_Exercises.c (referenced resource not located in this archive) (includes relational/logical expressions, math routines, and nested loops).
*   **Report**: [Lab_Report_1_Basic_Structures.pdf](Docs-%E8%AF%BE%E4%BB%B6%E4%B8%8E%E6%96%87%E6%A1%A3-docs/Lab_Report_1_Basic_Structures.pdf)

### B. Arrays and String Buffers (数组与字符串处理)
*   **Concepts**: Linear search and array index calculations; bubble sort and selection sort algorithms; multidimensional arrays for matrix calculations; string buffers and character arrays.
*   **Implementation**: Code examples in C_Course_Exercises.c (referenced resource not located in this archive) demonstrating sorting arrays and index searches.
*   **Report**: [Lab_Report_2_Arrays.pdf](Docs-%E8%AF%BE%E4%BB%B6%E4%B8%8E%E6%96%87%E6%A1%A3-docs/Lab_Report_2_Arrays.pdf)

### C. Modular Functions and Pointers (函数与指针)
*   **Concepts**: Function definition, prototyping, and scoping; variable scope (local vs. global, static variables); argument passing mechanisms (pass-by-value vs. pass-by-pointer/address).
*   **Implementation**: Subroutine definitions and address-passing exercises in C_Course_Exercises.c (referenced resource not located in this archive).
*   **Report**: [Lab_Report_3_Functions.pdf](Docs-%E8%AF%BE%E4%BB%B6%E4%B8%8E%E6%96%87%E6%A1%A3-docs/Lab_Report_3_Functions.pdf)

### D. User-Defined Structures (结构体数据结构)
*   **Concepts**: Packaging heterogeneous data fields (e.g., student records containing ID, name, and grades) into a single user-defined datatype `struct`. Accessing structure members using member operator (`.`) and structure pointer arrow operator (`->`).
*   **Programs**:
    *   [ch9_Structs_Average.c](Source-%E6%A0%B8%E5%BF%83%E6%BA%90%E7%A0%81/ch9_Structs_Average.c): Implements struct arrays to store student scores and compute the average score for each student.
    *   [ch10_Scores_Management.c](Source-%E6%A0%B8%E5%BF%83%E6%BA%90%E7%A0%81/ch10_Scores_Management.c): Manages student scores using structure pointers and queries English/Math performance.
*   **Report**: [Lab_Report_4_Structures.pdf](Docs-%E8%AF%BE%E4%BB%B6%E4%B8%8E%E6%96%87%E6%A1%A3-docs/Lab_Report_4_Structures.pdf)

---

## 2. File Mappings & Executions

1.  **C_Course_Exercises.c**: A consolidated C file exceeding 1000 lines of standard ANSI C, compiled and tested under Microsoft Visual Studio. It represents a continuous journal of basic to intermediate C exercises.
2.  **ch9_Structs_Average.c & ch10_Scores_Management.c**: Focused programs showcasing intermediate programming concepts: struct layouts and struct pointers, crucial for understanding database structures and hardware registers.
3.  **PDF Reports**: All four laboratory reports have been exported as high-fidelity PDF documents from original Word files, retaining all source codes, screenshots, and teacher annotations.
