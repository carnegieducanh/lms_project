🧠 LMS SOURCE CODE DOCUMENTATION

📐 CẤU TRÚC THƯ MỤC DỰ ÁN
LMS-SourceCode/
│
├── backend/ # 🔵 API Server (Laravel)
│ ├── app/
│ │ ├── Http/Controllers/front/ # Xử lý business logic
│ │ │ ├── AccountController.php
│ │ │ ├── HomeController.php
│ │ │ ├── CourseController.php
│ │ │ ├── ChapterController.php
│ │ │ ├── LessonController.php
│ │ │ ├── OutcomeController.php
│ │ │ └── RequirementController.php
│ │ │
│ │ └── Models/ # Cấu trúc dữ liệu
│ │ ├── User.php
│ │ ├── Course.php
│ │ ├── Chapter.php
│ │ ├── Lesson.php
│ │ ├── Category.php
│ │ ├── Level.php
│ │ ├── Language.php
│ │ ├── Outcome.php
│ │ ├── Requirement.php
│ │ ├── Enrollment.php
│ │ ├── Activity.php
│ │ ├── Review.php
│ │ └── ...
│ │
│ ├── database/
│ │ ├── migrations/ # Cấu trúc bảng DB
│ │ └── seeders/ # Dữ liệu mẫu
│ │
│ ├── routes/
│ │ └── api.php # Định tuyến API
│ │
│ └── ...
│
└── frontend/ # 🟣 Client (React)
├── src/
│ ├── App.jsx # Routing chính
│ ├── main.jsx # Entry point
│ │
│ ├── components/
│ │ ├── pages/ # Các trang chính
│ │ │ ├── Home.jsx
│ │ │ ├── Courses.jsx
│ │ │ ├── Detail.jsx
│ │ │ ├── Login.jsx
│ │ │ ├── Register.jsx
│ │ │ └── account/
│ │ │ ├── Dashboard.jsx
│ │ │ ├── MyCourses.jsx
│ │ │ ├── MyLearning.jsx
│ │ │ ├── WatchCourse.jsx
│ │ │ ├── ChangePassword.jsx
│ │ │ ├── Profile.jsx
│ │ │ └── courses/
│ │ │ ├── CreateCourse.jsx
│ │ │ ├── EditCourse.jsx
│ │ │ ├── EditLesson.jsx
│ │ │ └── LeaveRating.jsx
│ │ │
│ │ ├── common/ # Component dùng chung
│ │ ├── context/ # Global State (Auth)
│ │ └── assets/ # Ảnh, CSS, file tĩnh
│ │
│ └── ...
└── ...

🔄 APP FLOW - QUY TRÌNH CHẠY TỪNG BƯỚC
🟢1️⃣ KHỞI ĐỘNG ỨNG DỤNG
User mở trình duyệt
↓
main.jsx (Xử lý khởi động React)
├─→ Tạo AuthProvider (Quản lý trạng thái đăng nhập)
↓
App.jsx (Thiết lập routing)
├─→ Kiểm tra token đã lưu (localStorage)?
├─→ Nếu có → Restore đăng nhập
├─→ Nếu không → Cho phép chỉ xem công khai
↓
Hiển thị trang Home

🟡2️⃣ NGƯỜI DÙNG CHƯA ĐĂNG NHẬP - CÔNG KHAI
🏠 Home (Trang chủ)
├─→ GET /fetch-featured-courses
├─→ GET /fetch-categories
├─→ GET /fetch-levels
├─→ GET /fetch-languages
↓
📚 Courses (Danh sách khóa học)
├─→ GET /fetch-courses (Lọc, tìm kiếm)
↓
📖 Detail/:id (Chi tiết khóa học)
├─→ GET /fetch-course/{id}
├─→ Hiển thị: mô tả, mục tiêu, yêu cầu, giáo viên
├─→ Nút: "Đăng ký" (Redirect tới Login)

🔐 3️⃣ ĐĂNG KÝ / ĐĂNG NHẬP
📝 Register (Tạo tài khoản)
├─→ POST /register {name, email, password}
├─→ Backend tạo User mới
├─→ Tự động login
↓
🔑 Login (Đăng nhập)
├─→ POST /login {email, password}
├─→ Backend trả token (Sanctum)
├─→ Frontend lưu token vào localStorage
├─→ Redirect tới Dashboard

🎓 4️⃣ NGƯỜI DÙNG ĐÃ ĐĂNG NHẬP - QUY TRÌNH HỌC TẬP
📊 Dashboard (Bảng điều khiển cá nhân)
├─→ GET /user (Lấy thông tin user hiện tại)
├─→ GET /my-courses (Khóa học của người dùng)
├─→ GET /enrollments (Khóa học đã đăng ký)

📘 MyCourses (Danh sách khóa học)
├─→ Hiển thị: Khóa học tạo bởi tôi | Khóa học đã đăng ký

📘 MyLearning (Học tập)
├─→ GET /enrollments (Khóa học đang học)
├─→ Hiển thị progress, tiến độ

▶️ WatchCourse/:id (Xem bài học)
├─→ GET /enroll/{id}
├─→ GET /lessons/{id}
├─→ POST /save-activity (Ghi nhận xem bài)
├─→ POST /mark-as-complete (Đánh dấu hoàn thành)
├─→ POST /leave-rating (Đánh giá khóa học)

👤 Profile (Hồ sơ cá nhân)
├─→ GET /fetch-user
├─→ POST /update-user (Cập nhật thông tin)
└─→ POST /update-password (Đổi mật khẩu)

🏗 5️⃣ NGƯỜI DÙNG TẠO / CẬP NHẬT KHÓA HỌC
✨ CreateCourse (Tạo khóa học)
├─→ GET /courses/meta-data (Danh mục, cấp độ, ngôn ngữ)
├─→ POST /courses {title, description, category_id, level_id, ...}
├─→ POST /save-course-image/{id} (Upload ảnh bìa)

✏️ EditCourse/:id (Chỉnh sửa khóa học)
├─→ GET /courses/{id}
├─→ PUT /courses/{id}
├─→ POST /change-course-status/{id}

📌 Thêm nội dung:
├─→ Outcomes (Mục tiêu)
│ ├─→ GET /outcomes
│ ├─→ POST /outcomes + POST /sort-outcomes
│
├─→ Requirements (Yêu cầu)
│ ├─→ GET /requirements
│ ├─→ POST /requirements + POST /sort-requirements
│
├─→ Chapters (Chương)
│ ├─→ POST /chapters
│ ├─→ Kéo thả xếp thứ tự + POST /sort-chapters
│
└─→ Lessons (Bài học)
├─→ POST /lessons
├─→ POST /save-lesson-video/{id}
├─→ PUT /lessons/{id}
└─→ POST /sort-lessons

LeaveRating (Đánh giá)
├─→ POST /leave-rating {score, review}

📋 NHIỆM VỤ & CHỨC NĂNG CỦA TỪNG LAYER
Component Nhiệm vụ Kỹ thuật
Frontend (React) - Hiển thị giao diện<br>- Nhập liệu từ user<br>- Quản lý state (Auth)<br>- Validate form React, React Router, React Hook Form, SASS
Backend (Laravel) - Xử lý logic hoạt động<br>- Lưu trữ dữ liệu<br>- Xác thực (Auth)<br>- Trả về JSON API Laravel, Sanctum, Eloquent ORM
Database (MySQL) - Lưu Users, Courses, Lessons<br>- Lưu Enrollments (đăng ký)<br>- Lưu Activities (hoạt động)<br>- Lưu Reviews (đánh giá) MySQL, Relations, Migrations

🔗 QUAN HỆ GIỮA CÁC MODEL
User (Người dùng)
├─→ 1 User có nhiều Courses (Tạo tạo)
├─→ 1 User có nhiều Enrollments (Đăng ký)
├─→ 1 User có nhiều Activities (Xem video)
└─→ 1 User có nhiều Reviews (Đánh giá)

Course (Khóa học)
├─→ 1 Course thuộc 1 Category
├─→ 1 Course có 1 Level (Sơ cấp | Trung cấp | Nâng cao)
├─→ 1 Course có 1 Language
├─→ 1 Course có nhiều Chapters (Chương)
├─→ 1 Course có nhiều Outcomes (Mục tiêu)
├─→ 1 Course có nhiều Requirements (Yêu cầu)
├─→ 1 Course có nhiều Enrollments
└─→ 1 Course có nhiều Reviews

Chapter (Chương)
├─→ 1 Chapter thuộc 1 Course
└─→ 1 Chapter có nhiều Lessons

Lesson (Bài học)
├─→ 1 Lesson thuộc 1 Chapter
└─→ 1 Lesson có video_url

Enrollment (Đăng ký học)
├─→ 1 Enrollment thuộc 1 User
├─→ 1 Enrollment thuộc 1 Course
└─→ Ghi nhận ngày đăng ký, tiến độ

Activity (Hoạt động học)
├─→ Ghi nhận User xem Lesson nào
└─→ Ghi nhận thời gian xem

Review (Đánh giá)
├─→ 1 Review thuộc 1 User
├─→ 1 Review thuộc 1 Course
└─→ Chứa rating (sao) + content

🛠️ CÔNG NGHỆ SỬ DỤNG
🔵 Backend
Framework: Laravel 11
API Auth: Laravel Sanctum (Token-based)
Database: MySQL
ORM: Eloquent

🟣 Frontend
Framework: React 19
Routing: React Router v7
Form: React Hook Form
UI Kit: Bootstrap 5
Icons: React Icons
Text Editor: Jodit React
Upload: FilePond
Rating: react-simple-star-rating
Notifications: React Hot Toast
Drag & Drop: @hello-pangea/dnd
Video Player: React Player
Styling: SASS + Tailwind CSS

✨ TÓM TẮT QUY TRÌNH
User truy cập trang chủ → Xem danh sách khóa học, category
User xem chi tiết khóa học → Nhấn "Đăng ký"
User đăng ký / đăng nhập → Nhận token
User bắt đầu học → Xem video, đánh dấu hoàn thành
User đánh giá → Để lại review cho khóa học
Giáo viên tạo khóa học → Thêm chapter, lesson, upload video
Giáo viên quản lý → Chỉnh sửa, xóa nội dung

🎯 KẾT LUẬN
Đây là một nền tảng e-learning fullstack hoàn chỉnh:

✔ Có authentication
✔ Có phân quyền
✔ Có upload file/video
✔ Có tracking tiến độ
✔ Có rating & review
✔ Có drag & drop
