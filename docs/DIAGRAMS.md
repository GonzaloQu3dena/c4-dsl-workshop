# Diagrams Index

<p align="justify">
This document provides an organized index of all <b>DSL-based diagrams</b> available in this repository. Diagrams are grouped by type according to the <b>C4 Model</b> <b>Context</b>, <b>Container</b>, and <b>Component</b>. Each link points directly to its corresponding <i>.dsl</i> file.
</p>

## 🧭 Context Diagrams

<p align="justify">
High-level system overviews that illustrate how users and external systems interact with the main software systems.
</p>

- [01 - Simple Library System](/diagrams/context/01-simple-library-system.dsl)  
  _Basic library system with customers and loan terminals._

- [02 - Ticket Sales System](/diagrams/context/02-ticket-sales-system.dsl)  
  _Ticketing platform with multiple sales channels and external partners._

---

## 🧱 Container Diagrams

These diagrams break systems into major building blocks such as web applications, APIs, databases, and external services.

- [03 - Online Course Platform](/diagrams/container/03-online-course-platform.dsl)  
  _E-learning system composed of a backend, frontend, and integrated external tools._

- [04 - Restaurant Reservation Platform](/diagrams/container/04-restaurant-reservation-platform.dsl)  
  _Reservation system with a mobile app, internal and public APIs, a database, and an SMS service._

---

## 🧩 Component Diagrams

<p>
Detailed breakdowns of individual containers, showing internal components like services, controllers, and modules.
</p>

- [05 - Course Platform Backend](/diagrams/component/05-course-platform-backend.dsl)
  A component diagram showing the **API Backend** of the Online Course Platform, which includes key components such as `CourseController`, `CourseService`, and `CourseRepository`. These components handle HTTP requests, business logic, and data access for managing courses and assessments.