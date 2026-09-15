# Computer Software Basics (计算机软件基础)

This repository contains the academic portfolio for the course **Computer Software Basics (计算机软件基础)**, completed by **Chaoran Liu (刘超然)**. 

The portfolio features implementations of fundamental **Data Structures** in C (Sequential Lists, Linked Lists, Stacks, and Queues) and a practical **Relational Database Design Project** (Classroom Management System) built on Microsoft Access.

---

## Portfolio Directory Structure

```
Computer-Software-Basics/
│
├── README.md                                 # This document
│
├── Data-Structures/                          # C-based Data Structures Simulation (Labs 1-4)
│   ├── src/
│   │   ├── Lab1_1_Sequential_List_Students.c # Student scores list filtering (Sequential)
│   │   ├── Lab1_2_Set_Operations.c           # Set union and intersection operations
│   │   ├── Lab2_1_Doubly_Linked_List.c       # Bidirectional traversal linked list
│   │   ├── Lab2_2_Circular_Linked_List.c     # Circular single list for multi-class records
│   │   ├── Lab3_1_Sequential_Stack.c         # Sequential stack for expression evaluation
│   │   ├── Lab3_2_Linked_Stack.c             # Linked stack for expression evaluation
│   │   ├── Lab4_1_Circular_Queue.c           # Circular queue for character stream parsing
│   │   └── Lab4_2_Linked_Queue.c             # Linked queue for character stream parsing
│   └── docs/
│       ├── Lab_Report_1_Sequential_Lists.pdf # Lab 1 sequential list report
│       ├── Lab_Report_2_Linked_Lists.pdf     # Lab 2 linked lists report
│       ├── Lab_Report_3_Stacks.pdf           # Lab 3 stack expression report
│       └── Lab_Report_4_Queues.pdf           # Lab 4 queue buffer report
│
└── Database-Project/                         # Relational Database Course Project
    ├── src/
    │   └── Classroom_Management_System.accdb # Microsoft Access database file
    └── docs/
        └── Database_Design_Report_Classroom_Management.pdf # Database system design report
```

---

## 1. Data Structures Section (数据结构部分)

The data structures section explores the fundamental memory layouts and core operations of linear data representations.

### A. Sequential Lists (顺序表)
*   **Concepts**: Linear lists stored in contiguous memory arrays.
*   **Programs**:
    *   [Lab1_1_Sequential_List_Students.c](Data-Structures/src/Lab1_1_Sequential_List_Students.c): Sequential storage representation of student records, sorting, and score filtering ($<60$).
    *   [Lab1_2_Set_Operations.c](Data-Structures/src/Lab1_2_Set_Operations.c): Modifying sequential list structures to calculate set intersection and union operations for integer arrays.
*   **Report**: [Lab_Report_1_Sequential_Lists.pdf](Data-Structures/docs/Lab_Report_1_Sequential_Lists.pdf)

### B. Linked Lists (链表)
*   **Concepts**: Non-contiguous memory allocation using nodes linked via pointer fields.
*   **Programs**:
    *   [Lab2_1_Doubly_Linked_List.c](Data-Structures/src/Lab2_1_Doubly_Linked_List.c): Node structure containing `prior` and `next` pointers. Implements bidirectional traversal to search student grades.
    *   [Lab2_2_Circular_Linked_List.c](Data-Structures/src/Lab2_2_Circular_Linked_List.c): Circular single linked lists representing multi-class student lists.
*   **Report**: [Lab_Report_2_Linked_Lists.pdf](Data-Structures/docs/Lab_Report_2_Linked_Lists.pdf)

### C. Stacks (栈)
*   **Concepts**: Last-In-First-Out (LIFO) data structure.
*   **Programs**:
    *   [Lab3_1_Sequential_Stack.c](Data-Structures/src/Lab3_1_Sequential_Stack.c): Sequential stack implementation to evaluate mathematical infix expressions of type `a+b*(c-d)`.
    *   [Lab3_2_Linked_Stack.c](Data-Structures/src/Lab3_2_Linked_Stack.c): Linked stack implementation for mathematical expression evaluation.
*   **Report**: [Lab_Report_3_Stacks.pdf](Data-Structures/docs/Lab_Report_3_Stacks.pdf)

### D. Queues (队列)
*   **Concepts**: First-In-First-Out (FIFO) data structure.
*   **Programs**:
    *   [Lab4_1_Circular_Queue.c](Data-Structures/src/Lab4_1_Circular_Queue.c): Circular array queue resolving space wastage. Buffers a stream of characters (numbers enqueue, lowercases trigger dequeue).
    *   [Lab4_2_Linked_Queue.c](Data-Structures/src/Lab4_2_Linked_Queue.c): Linked queue implementation for character stream buffering.
*   **Report**: [Lab_Report_4_Queues.pdf](Data-Structures/docs/Lab_Report_4_Queues.pdf)

---

## 2. Database Design Project (数据库设计部分)

A desktop database management application designed to automate school classroom resource scheduling, usage records logging, and equipment maintenance tracking.

### System Specifications
*   **Platform**: Microsoft Access
*   **Database File**: [Classroom_Management_System.accdb](Database-Project/src/Classroom_Management_System.accdb) (Includes tables, pre-configured relations, SQL query templates, and user forms).
*   **Design Report**: [Database_Design_Report_Classroom_Management.pdf](Database-Project/docs/Database_Design_Report_Classroom_Management.pdf) (Outlining entity relationships (E-R diagrams), schema normalization, and interface layout).

### Database Relations
The database defines three primary tables with established integrity constraints (primary and foreign keys):
1.  **Classroom Table (教室信息表)**: Stores classroom IDs, capacities, equipment levels, and buildings.
2.  **Repairs Table (报修记录表)**: Tracks equipment repairs, detailing dates, fault descriptions, and resolution status (Foreign key links to classroom IDs).
3.  **Usage Records Table (使用记录表)**: Tracks course scheduling and event bookings (Foreign key links to classroom IDs).
