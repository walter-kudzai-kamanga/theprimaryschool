# Kamanga Primary Spring Boot API

This project is a migration of the Kamanga Primary School Management System from Django/PHP to a Java Spring Boot API.

## Structure
- **src/main/java/com/kamanga/**: Java source code (API, models, controllers)
- **src/main/resources/static/**: All static HTML, JS, and CSS files
- **src/main/resources/static/folders/**: Additional static assets (CSS, Bootstrap, JS)
- **src/main/resources/application.properties**: Spring Boot configuration

## How to Run
1. Make sure you have Java 17+ and Maven installed.
2. In the project root, run:
   ```
   mvn spring-boot:run
   ```
3. Access static files at `http://localhost:8080/index.html` (or any HTML file).
4. The H2 database console is available at `/h2-console`.

## Next Steps
- Implement Java models, repositories, controllers for each feature (students, staff, finance, etc.)
- Add business logic as needed

---

