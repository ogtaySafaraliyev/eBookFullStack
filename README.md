# 📚 eBook Full Stack Application

## 🧩 What Problem Does the Project Solve? Or, What It Does?

The **eBook Full Stack** application is a full-fledged web platform where users can browse, add to cart, and purchase Books. The goal is to create a digital library system that:

- Allows readers to access eBooks from anywhere
- Provides a clean, responsive UI for a pleasant reading experience
- Offers an admin panel for content management
- Ensures secure user authentication and session management
- Let users add eBooks to a cart for managing selected items

This application replaces traditional library systems and mitigates the challenges of managing and accessing physical books.

---

## 🛠️ Why You Used Specific Technologies?

### Backend

- **Java + Servlet (Apache Tomcat)**  
  A lightweight, flexible backend built using raw Java Servlets hosted on Apache Tomcat. This choice avoids the complexity of heavier frameworks like Spring Boot while maintaining control over HTTP requests and business logic.

- **MySQL**  
  A stable, relational database that stores user data, book information, and purchase history with structured schema relationships.

### Frontend

- **JSP**  
  Classic web technologies combined with JSP (Java Server Pages) for rendering dynamic content on the server side. JavaScript enhances interactivity and DOM manipulation.

- **Bootstrap 4**  
  Used for mobile-first, responsive design. It helps maintain consistent UI/UX styling and provides ready-to-use components.

---

## ✨ Features

- 🔐 **User Authentication**  
  Login, registration, and secure session handling

- 📚 **Book Catalog**  
  Browse, view details, and read eBooks online

- 🔍 **Search & Filtering**  
  Find books by title, author, or genre

- 🛒 **Add to Cart:**  
  Users can add eBooks to their cart and manage them before finalizing their selection.

- 🖥️ **Responsive Design**  
  Fully functional on desktop and mobile devices

- 🛠️ **Admin Panel**  
  Admin can add/edit/delete books and manage users

---

## 🚀 Technologies Used

| Layer       | Technologies                        |
|-------------|-------------------------------------|
|     **Frontend**   | Bootstrap 4, HTML5, CSS3, JSTL, JSP |
|     **Backend**    | Java EE, Apache Tomcat              |
|    **Database**    | MySQL Workbench, JDBC               |
|      **Tools**     | Git, GitHub, Eclipse IDE            |
|  **Dependencies**  | JSTL, Junit                         |

---

## 📸 Screenshots

<!-- Replace the below image placeholders with real screenshots when available -->
Home page
![image](https://github.com/user-attachments/assets/b5a0d6af-d510-48e3-b3f3-559e4c18409a)
![image](https://github.com/user-attachments/assets/aeacaeef-7666-4369-ba3d-bbc324dd9d95)



| Login Page                                                                                | Register page                                                                             |
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/f89b924c-bd43-4860-aeba-7f382c9acb13) | ![image](https://github.com/user-attachments/assets/4b801449-a6cc-432b-aeda-343ba0bfd211) | 


Admin operations

| Admin Home Page                                                                           | Add Book Page                                                                             |
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/1c849dcf-9013-416b-ae24-c34c189147bd) | ![image](https://github.com/user-attachments/assets/6acf6e1d-3801-4c6f-be58-6706190435a0) | 


| Edit Book Page                                                                            | Admin All Books Page                                                                      |
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/65dc372a-a88d-43ed-b52d-6311c7dc84ee) | ![image](https://github.com/user-attachments/assets/0e555b5c-d1e8-4672-8b71-6cf460588229) | 


| Admin All Orders Page                                                                     | Admin Logout Successfully Page                                                                      |
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/1e10a00d-ff65-43b2-b6a6-0be157077e87) | ![image](https://github.com/user-attachments/assets/6c2858bc-7c98-4e7e-8120-6741023ca19b) | 



User operations

| Settings page                                                                             | Sell Old Book Page                                                                        |
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/8f3f954b-98c0-4193-8d65-6ce4e95f6669) | ![image](https://github.com/user-attachments/assets/714009f3-0a9c-4d6f-91b2-ce43669f3732) | 


| Edit Profile Page                                                                         | Contact page                                                                              |                                               
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/455ef933-352b-4e19-bf11-a71a34dbd453) | ![image](https://github.com/user-attachments/assets/b0d99f41-aee5-4c5a-bbe5-f04ed150a752) |


| User Orders Page                                                                          | User Location Page                                                                        |
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/1c849dcf-9013-416b-ae24-c34c189147bd) | ![image](https://github.com/user-attachments/assets/e349b7ab-e5a3-4000-811c-0d67e62193eb) | 


| Searching For Any Combination Of Letters. for example = "ar"                              | User Logout Page                                                                          |
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/25ebe079-e9f7-47eb-9f06-fe171236f327) | ![image](https://github.com/user-attachments/assets/30fd558d-e36c-43ea-810c-86e99c540ffd) | 


| Books In Cart And Details Of User Order                                                   | After Deletion Book From Cart                                                             |
|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| ![image](https://github.com/user-attachments/assets/563b0b4d-19de-46fa-a3aa-ebf465de9293) | ![image](https://github.com/user-attachments/assets/6dce547c-7d81-48ab-910a-dd19ba2676db) | 


> 📌 *Please upload these screenshots in a folder named `screenshots/` inside the project directory.*

---

## 📂 Project Structure (Simplified)
eBookFullStack/
├── backend/
│ ├── src/
│ ├── pom.xml
│ └── ...
├── frontend/
│ ├── public/
│ ├── src/
│ └── package.json
├── README.md
└── ...

