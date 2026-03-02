# INTERVIEW GUIDE — LMS Project
### Vị trí: Web Engineer (Junior ~ 2 năm) | Công ty Nhật

---

## Tóm Tắt Nhanh (Quick Summary)
> Đọc phần này 10 phút trước phỏng vấn để ôn lại nhanh toàn bộ dự án.

### Tổng quan dự án
- Hệ thống **E-Learning (LMS)** full-stack, tương tự Udemy — nơi instructor tạo khóa học, student học và theo dõi tiến độ
- Kiến trúc **tách biệt hoàn toàn** giữa Backend (Laravel REST API) và Frontend (React SPA)
- Backend chạy trên **Render**, Database trên **Railway (MySQL)**, Frontend trên **Vercel**, media trên **Cloudinary**
- Có 2 role: **Instructor** (tạo/quản lý khóa học) và **Student** (đăng ký/học/đánh giá)
- Dự án hoàn chỉnh, đã deploy production, có health check endpoint cho UptimeRobot

### Công nghệ sử dụng
- **Backend:** PHP 8.2 + Laravel 12, RESTful API, Laravel Sanctum (token auth), Eloquent ORM
- **Frontend:** React 19, React Router v7, React Hook Form, Context API, Vite, Bootstrap 5 + Tailwind CSS 4
- **Database:** SQLite (local dev) → MySQL on Railway (production)
- **Cloud:** Cloudinary (ảnh + video), Vercel (frontend deploy), Render (backend Docker)
- **Libraries đặc biệt:** `@hello-pangea/dnd` (drag-drop), FilePond (upload), Jodit (rich text), React Player (video), i18next (đa ngôn ngữ)

### Môi trường phát triển
- Local: XAMPP (Apache + PHP) + SQLite + Vite dev server
- Docker: Dockerfile (php:8.2-apache) cho backend production build
- Config tách biệt qua `.env` (backend) và `.env` (frontend VITE_API_URL)
- Production: Multi-platform deployment — Render + Railway + Cloudinary + Vercel

### Các tính năng triển khai chính
- **Auth:** Đăng ký / Đăng nhập với Sanctum Bearer Token, lưu localStorage, route guard (RequireAuth)
- **Course Management:** CRUD đầy đủ — tạo draft, upload ảnh/video lên Cloudinary, publish/unpublish
- **Drag & Drop:** Sắp xếp thứ tự chapter, lesson, outcome, requirement bằng `@hello-pangea/dnd`
- **Learning Flow:** Enroll → Xem video → Track activity (is_completed, is_last_watched) → Rate & Review
- **UX:** Đa ngôn ngữ (i18next), dark/light mode (Context API), toast notifications, loading states

### Kết quả và bài học kinh nghiệm
- Deploy thành công lên production, URL công khai hoạt động ổn định
- Học được cách thiết kế RESTful API chuẩn và tích hợp với React SPA
- Hiểu sâu về token-based authentication và CORS configuration
- Nắm được luồng upload file (ảnh/video) qua third-party cloud (Cloudinary)
- Nhận ra tầm quan trọng của việc tách môi trường (local/production) qua `.env`

---

## 1. Tổng Quan Dự Án

### Đây là loại hệ thống gì?
Đây là một **Learning Management System (LMS)** — hệ thống quản lý học tập trực tuyến tương tự Udemy hoặc Coursera thu nhỏ.

**Hai nhóm người dùng chính:**
- **Instructor (Giảng viên):** Tạo khóa học, upload video bài giảng, quản lý nội dung, publish lên public
- **Student (Học viên):** Tìm kiếm khóa học, đăng ký, xem video, theo dõi tiến độ, đánh giá khóa học

**Luồng chính của hệ thống:**
```
[Instructor] Tạo course → Thêm chapter/lesson → Upload video → Publish
[Student]    Tìm course → Enroll → Xem video → Mark complete → Rate & Review
```

---

### Kiến trúc tổng thể

```
┌──────────────────────────────────────────────────────────────┐
│                        ARCHITECTURE                          │
├─────────────────────┬───────────────────────────────────────┤
│   FRONTEND (Vercel) │         BACKEND (Render)               │
│   React 19 SPA      │    Laravel 12 REST API (PHP 8.2)       │
│   Port: 5173 (dev)  │    Port: 8000 (dev)                    │
│                     │              │                          │
│   React Router ─────┼──── HTTP ────┤  MySQL (Railway)         │
│   Context API       │  JSON/REST   │  Cloudinary (Media)      │
│   Vite Build        │    Bearer    │  Docker Container        │
└─────────────────────┴──────────────────────────────────────-─┘
```

**Điểm quan trọng:** Frontend và Backend hoàn toàn **tách biệt** (decoupled), giao tiếp qua HTTP REST API. Đây là mô hình **SPA + API** — rất phổ biến ở các công ty Nhật hiện nay.

---

### Mô hình thiết kế

| Tầng | Pattern | Chi tiết |
|------|---------|----------|
| Backend | **MVC** | Models (Eloquent), Controllers, Routes (api.php) |
| Backend | **RESTful API** | HTTP verbs + resource-based URLs |
| Frontend | **Component-based** | Pages, Common components, Context providers |
| Frontend | **SPA (Single Page App)** | React Router, không reload trang |
| Auth | **Token-based** | Bearer token (Sanctum), không dùng session cookie |

---

## 2. Phân Tích Công Nghệ Sử Dụng

### Backend Stack

---

#### PHP 8.2 + Laravel 12

**Dùng để làm gì?**
Xây dựng REST API backend — xử lý logic nghiệp vụ, authentication, database operations.

**Vì sao chọn Laravel?**
- Convention over configuration: cấu trúc rõ ràng ngay từ đầu (routes, controllers, models)
- Eloquent ORM giúp thao tác database bằng PHP thuần thay vì viết SQL thủ công
- Sanctum có sẵn, tích hợp auth token rất nhanh
- Cộng đồng lớn, tài liệu đầy đủ — phù hợp cho junior developer

**Alternative nào khác?**
| Alternative | Nhược điểm so với Laravel |
|------------|--------------------------|
| Node.js + Express | Phải tự setup nhiều thứ, không có convention mạnh |
| Django (Python) | Team không có kinh nghiệm Python |
| CodeIgniter (PHP) | Cũ hơn, ít tính năng built-in |
| Symfony (PHP) | Quá phức tạp cho project cỡ này |

**Câu trả lời phỏng vấn khi hỏi "Tại sao chọn Laravel?":**
> "Tôi chọn Laravel vì nó cung cấp đủ mọi thứ cần thiết cho một REST API — routing, ORM, authentication — mà không cần cài thêm nhiều library. Với Laravel Sanctum, tôi implement token auth chỉ trong vài dòng code. Quan trọng hơn, cấu trúc MVC rõ ràng giúp code dễ maintain khi project lớn dần."

---

#### Laravel Sanctum

**Dùng để làm gì?**
Quản lý xác thực (authentication) cho API — tạo và verify Bearer token.

**Cách hoạt động:**
```
1. User POST /login với email + password
2. Server verify → tạo personal_access_token → trả về token string
3. Client lưu token vào localStorage
4. Mỗi request sau: gửi kèm "Authorization: Bearer {token}"
5. Server middleware 'auth:sanctum' verify token → cho phép hoặc từ chối
```

**Tại sao dùng token thay vì session?**
> "Vì frontend và backend là 2 domain khác nhau (Vercel và Render). Nếu dùng session/cookie thì bị chặn bởi CORS và SameSite policy. Token-based auth không phụ thuộc domain, dễ integrate với React SPA."

**Alternative:** JWT (JSON Web Token) — Sanctum đơn giản hơn cho monolithic app vì token lưu trong DB, dễ revoke. JWT stateless hơn nhưng không thể thu hồi token đơn lẻ.

---

#### Eloquent ORM + Database Design

**Dùng để làm gì?**
Giao tiếp với database bằng PHP object thay vì raw SQL.

**Ví dụ thực tế trong project:**
```php
// Thay vì viết SQL:
SELECT courses.*, COUNT(enrollments.id) as enrollments_count,
       SUM(reviews.rating) as reviews_sum...

// Eloquent viết:
Course::withCount('enrollments')
      ->withSum('reviews', 'rating')
      ->where('status', 1)
      ->get();
```

**Quan hệ database trong project:**
```
users ──< courses (1 instructor có nhiều khóa học)
courses ──< chapters ──< lessons (1 khóa có nhiều chương, mỗi chương có nhiều bài)
users ──< enrollments >── courses (student đăng ký khóa học)
users ──< activities (track tiến độ học từng bài)
users ──< reviews >── courses (đánh giá khóa học)
courses ──< outcomes, requirements (mục tiêu & yêu cầu)
```

---

#### Cloudinary

**Dùng để làm gì?**
Lưu trữ và phân phối ảnh (course cover) và video (lesson video) trên cloud.

**Vì sao không dùng local storage?**
> "Nếu lưu file trên server, khi server restart (Render free tier) thì mất hết. Cloudinary là third-party CDN chuyên biệt — ảnh được tự động optimize, resize, cache global. Đặc biệt tính năng URL transformation giúp tôi tạo thumbnail 750×450 chỉ bằng cách thêm `w_750,h_450,c_fill` vào URL — không cần code xử lý ảnh phía server."

---

### Frontend Stack

---

#### React 19

**Dùng để làm gì?**
Xây dựng giao diện người dùng dạng SPA — tương tác mượt mà, không reload trang.

**Tại sao React?**
- Component-based: tái sử dụng UI (Course card, Header, Loading spinner)
- Virtual DOM: cập nhật UI hiệu quả
- Ecosystem lớn: dễ tìm library phù hợp cho mọi nhu cầu
- React 19 có cải tiến về performance và Server Components

**Alternative:**
| Alternative | So sánh |
|------------|---------|
| Vue.js | Nhẹ hơn, dễ học hơn, nhưng ecosystem nhỏ hơn |
| Angular | Quá nặng cho project này, phức tạp hơn |
| Next.js | Có SSR tốt hơn nhưng phức tạp hơn thuần React |

---

#### React Context API (State Management)

**Dùng để làm gì?**
Quản lý global state: thông tin user đăng nhập (Auth) và theme (dark/light mode).

**Tại sao không dùng Redux?**
> "Redux phù hợp cho app có state phức tạp, nhiều reducer, middleware. Project này chỉ cần share user info và theme giữa các component — Context API đủ dùng và đơn giản hơn nhiều. Không cần thêm dependency, ít boilerplate code."

**Cách implement:**
```javascript
// Auth Context lưu: { name, id, token }
// Lưu localStorage để persist sau khi refresh trang
// RequireAuth component bảo vệ private routes
```

---

#### React Hook Form

**Dùng để làm gì?**
Xử lý form validation phía client (đăng ký, đăng nhập, tạo khóa học, đổi mật khẩu).

**Tại sao chọn React Hook Form thay vì Formik?**
> "React Hook Form ít re-render hơn Formik vì dùng uncontrolled components với refs. API đơn giản, validation tích hợp tốt, bundle size nhỏ hơn. Với form phức tạp như tạo khóa học, performance quan trọng."

---

#### Vite

**Dùng để làm gì?**
Build tool thay thế Create React App — bundler và dev server.

**Ưu điểm:**
- Hot Module Replacement (HMR) cực nhanh — save file là thấy ngay thay đổi
- Build production nhanh gấp nhiều lần Webpack
- Config đơn giản hơn CRA

---

#### @hello-pangea/dnd (Drag & Drop)

**Dùng để làm gì?**
Cho phép instructor kéo thả để sắp xếp thứ tự: chapter, lesson, outcome, requirement.

**Tại sao cần tính năng này?**
> "Thứ tự bài học rất quan trọng cho trải nghiệm học. Thay vì nhập số thứ tự thủ công, drag-drop trực quan và thân thiện hơn. Sau khi kéo thả, frontend gửi mảng IDs với thứ tự mới lên API `/sort-chapters`, backend cập nhật sort_order trong DB."

---

#### i18next (Internationalization)

**Dùng để làm gì?**
Hỗ trợ đa ngôn ngữ — hiện tại là tiếng Anh, có thể mở rộng thêm tiếng Nhật, tiếng Việt.

**Ứng dụng trong phỏng vấn Nhật:**
> "Tôi nhận thức được tầm quan trọng của i18n ngay từ đầu. Thay vì hardcode text tiếng Anh, tôi dùng i18next nên có thể thêm tiếng Nhật sau này chỉ bằng cách thêm file JSON translation, không cần sửa code component."

---

#### Bootstrap 5 + Tailwind CSS 4

**Dùng để làm gì?**
Styling giao diện — Bootstrap cho component library (modal, card, grid), Tailwind cho custom utility styling.

**Tại sao dùng cả 2?**
> "Bootstrap cung cấp sẵn component UI phức tạp như modal, accordion. Tailwind giúp custom nhanh mà không cần viết class CSS tùy ý. Trong thực tế 2 thư viện này có thể coexist nếu quản lý specificity CSS cẩn thận."

---

## 3. Phân Tích Backend

### Cấu trúc thư mục nói lên điều gì?

```
backend/
├── app/
│   ├── Http/Controllers/front/   # Tất cả controllers đặt trong "front" namespace
│   │   ├── AccountController     # Auth + User profile + Dashboard
│   │   ├── HomeController        # Public API (courses, categories, enrollment)
│   │   ├── CourseController      # CRUD khóa học
│   │   ├── ChapterController     # CRUD chương + sort
│   │   ├── LessonController      # CRUD bài học + video upload + sort
│   │   ├── OutcomeController     # Learning outcomes + sort
│   │   └── RequirementController # Prerequisites + sort
│   └── Models/                   # 12 Eloquent models
├── database/
│   ├── migrations/               # Schema versioning
│   ├── seeders/                  # Dữ liệu mẫu
│   └── factories/                # Test data
├── routes/api.php                # Toàn bộ API routes
└── lms_project.sql               # Database dump để setup nhanh
```

**Nhận xét:** Tất cả controllers nằm trong namespace `front/` — có thể ban đầu dự định tách thêm `admin/` namespace nhưng chưa implement. Đây là điểm có thể cải thiện về cấu trúc (tham khảo mục 7).

---

### Cách xử lý routing

**Backend — api.php:**
```
Public routes (không cần auth):
  POST /register, POST /login
  GET  /fetch-courses, /fetch-course/{id}, /fetch-featured-courses
  GET  /fetch-categories, /fetch-levels, /fetch-languages
  GET  /health (cho UptimeRobot)

Protected routes (middleware: auth:sanctum):
  CRUD: /courses, /chapters, /lessons, /outcomes, /requirements
  Sort: /sort-chapters, /sort-lessons, /sort-outcomes, /sort-requirements
  Media: /save-course-image/{id}, /save-lesson-video/{id}
  User: /enroll-course, /save-activity, /mark-as-complete
```

**Frontend — React Router:**
```
Public: /, /courses, /detail/:id, /login, /register
Protected (RequireAuth): /account/dashboard, /account/my-courses,
                         /account/my-learning, /account/watch-course/:id...
```

---

### Authentication được implement như thế nào?

**Flow chi tiết:**

```
REGISTER:
Client → POST /register { name, email, password }
Server → validate (email unique, min length) → hash password (bcrypt rounds:12)
       → create user → return success message

LOGIN:
Client → POST /login { email, password }
Server → Auth::attempt({ email, password })
       → nếu đúng: $user->createToken('token')->plainTextToken
       → return { token, name, id }
Client → lưu vào localStorage key 'userInfoLms'
       → setUser({ token, name, id })

PROTECTED REQUEST:
Client → Header: "Authorization: Bearer eyJ..."
Server → middleware auth:sanctum tự động verify token
       → tìm user trong personal_access_tokens table
       → $request->user() trả về user object

LOGOUT:
Client → $request->user()->tokens()->delete() (revoke all tokens)
       → localStorage.removeItem('userInfoLms')
       → setUser(null)
```

**Bảo mật đáng chú ý:**
- Password hash bằng `bcrypt` với 12 rounds (secure)
- CORS được cấu hình chỉ cho phép đúng FRONTEND_URL
- Token không có expiry (có thể cải thiện thêm expiration policy)

---

### Database design có đặc điểm gì?

**Thiết kế tốt:**
- Normalize đúng cách: Category, Level, Language là bảng riêng (không hardcode)
- Tracking granular: `activities` table lưu từng bài học user đã xem (`is_completed`, `is_last_watched`)
- Soft relations: `category_id`, `level_id` nullable — course có thể tồn tại không có category
- Ordering: các bảng chapter, lesson, outcome, requirement đều có `sort_order` field

**Schema đáng chú ý — Activities:**
```sql
activities:
  user_id     → biết AI học
  course_id   → thuộc khóa nào
  chapter_id  → thuộc chương nào
  lesson_id   → bài học nào
  is_completed (enum: yes/no)   → đã hoàn thành chưa
  is_last_watched (enum: yes/no) → bài cuối cùng xem (resume learning)
```

**Trade-off:** Dùng `enum('yes','no')` thay vì `boolean` — có thể do compatibility với SQLite. Về mặt convention, `tinyint(1)` chuẩn hơn cho boolean field.

---

### Điểm có thể cải thiện

1. **Pagination:** API `fetch-courses` chưa có pagination — khi có 1000 khóa học sẽ slow
2. **Validation tập trung:** Validation logic nằm trong controller, nên tách ra FormRequest class
3. **Error handling:** Một số nơi chưa có try-catch, lỗi DB có thể expose thông tin nhạy cảm
4. **Token expiry:** Personal access token không có expiration date
5. **Rate limiting:** Chưa có rate limit trên login endpoint (brute force risk)

---

## 4. Phân Tích Frontend

### Cách tổ chức component

```
src/
├── App.jsx              # Route definitions
├── main.jsx             # Providers: Auth, Theme, i18n, Router
├── components/
│   ├── pages/           # Page-level components (1 per route)
│   │   ├── Home.jsx
│   │   ├── Courses.jsx
│   │   ├── Detail.jsx
│   │   ├── Login.jsx
│   │   ├── Register.jsx
│   │   └── account/     # Protected pages
│   ├── common/          # Reusable across pages
│   │   ├── Header.jsx
│   │   ├── Footer.jsx
│   │   ├── Layout.jsx
│   │   ├── Course.jsx          # Course card
│   │   ├── RequireAuth.jsx     # Route guard
│   │   └── Config.jsx          # API URL + helper utils
│   └── context/         # Global state
│       ├── Auth.jsx
│       └── Theme.jsx
└── i18n/                # Translation files
```

**Tổ chức logic:** Pages gọi API và pass data xuống, Common components nhận props và render. Pattern này clean và dễ maintain.

---

### State Management

**Context API — 2 contexts:**

```javascript
// Auth Context
const AuthContext = createContext();
// State: { name, id, token } hoặc null
// Persistence: localStorage key 'userInfoLms'
// Functions: login(userInfo), logout()

// Theme Context
const ThemeContext = createContext();
// State: 'light' | 'dark'
// Toggle: switchTheme()
```

**Tại sao không cần Redux/Zustand?**
> Chỉ có 2 global state cần share. Redux sẽ là overengineering — thêm boilerplate, thêm learning curve, không có benefit thực tế ở project scale này.

---

### Xử lý API call

**Config.jsx — centralized config:**
```javascript
export const API_URL = import.meta.env.VITE_API_URL;

// Helper: lấy token từ localStorage
export const getToken = () => {
  const user = JSON.parse(localStorage.getItem('userInfoLms'));
  return user?.token || null;
};
```

**Pattern API call trong component:**
```javascript
// useEffect khi component mount
useEffect(() => {
  const fetchData = async () => {
    setLoading(true);
    try {
      const res = await axios.get(`${API_URL}/fetch-courses`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      setCourses(res.data.data);
    } catch (err) {
      toast.error('Something went wrong');
    } finally {
      setLoading(false);
    }
  };
  fetchData();
}, []);
```

**Điểm có thể cải thiện:** Chưa có custom hook `useFetch` để tái sử dụng logic — nhiều component lặp lại pattern loading/error/data state.

---

### Validation phía client

**React Hook Form implementation:**
```javascript
const { register, handleSubmit, formState: { errors } } = useForm();

// Registration validation rules:
- name: required, minLength(5)
- email: required, pattern(email regex)
- password: required, minLength(8)

// Double validation:
// Client: immediate feedback khi user nhập
// Server: validate lại trước khi lưu DB (defense in depth)
```

**UX validation:** Hiển thị lỗi ngay dưới field khi blur hoặc submit — không cần đợi server response cho các lỗi format đơn giản.

---

### UX đáng chú ý

| Tính năng | Implementation | Lý do |
|-----------|---------------|-------|
| Toast notifications | React Hot Toast | Non-blocking, tự dismiss, stack nhiều notification |
| Loading states | Loading.jsx spinner | Prevent user confusion khi API call chậm |
| Dark/Light mode | ThemeContext + localStorage | User preference persists qua sessions |
| Drag & drop sort | @hello-pangea/dnd | Trực quan hơn số thứ tự thủ công |
| Video player | React Player | Support nhiều nguồn video, custom controls |
| File upload preview | FilePond | Xem trước ảnh/video trước khi upload |
| Rich text editor | Jodit | Instructor có thể format description đẹp |
| Resume learning | is_last_watched flag | Tiếp tục đúng bài đang học khi quay lại |

---

## 5. DevOps / Environment

### Docker được dùng thế nào?

```dockerfile
# Dockerfile — Backend only
FROM php:8.2-apache

# Cài PHP extensions cần thiết
RUN docker-php-ext-install pdo pdo_mysql zip bcmath

# Cài Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Enable Apache mod_rewrite (cần cho Laravel routing)
RUN a2enmod rewrite

# Document root → /var/www/html/public (Laravel standard)
RUN sed -i 's|/var/www/html|/var/www/html/public|' ...

# Copy code, set permissions
COPY . /var/www/html
RUN chown -R www-data:www-data storage bootstrap/cache

# Entrypoint: migrate + start Apache
CMD ["docker-entrypoint.sh"]
```

**docker-entrypoint.sh:**
```bash
php artisan migrate --force    # Tự động migrate khi deploy
php artisan key:generate        # Generate app key nếu chưa có
apache2-foreground              # Start web server
```

---

### Deployment architecture

```
┌─────────────┐     ┌──────────────────────┐     ┌─────────────┐
│   Vercel    │────▶│   Render (Docker)     │────▶│   Railway   │
│  Frontend   │ API │   Laravel Backend     │ SQL │   MySQL DB  │
│  React SPA  │     │   PHP 8.2 Apache      │     │   Prod DB   │
└─────────────┘     └──────────────────────┘     └─────────────┘
                              │
                              ▼
                    ┌─────────────────┐
                    │   Cloudinary    │
                    │  Images/Videos  │
                    └─────────────────┘
```

**Lý do chọn từng platform:**
- **Render:** Hỗ trợ Docker deployment, free tier có sẵn, tự động build từ GitHub
- **Railway:** Managed MySQL, không cần cài đặt, dễ lấy connection string
- **Cloudinary:** CDN toàn cầu cho media, free tier 25GB
- **Vercel:** Tối ưu cho React/Vite, deploy cực nhanh, tự động detect framework

---

### Nếu recruiter hỏi về CI/CD

**Thực tế project này:**
> "Hiện tại project dùng manual deployment: push code lên GitHub → Render tự động detect và rebuild Docker container. Vercel cũng auto-deploy khi có commit mới trên main branch. Đây là basic CD (Continuous Deployment) thông qua Git integration."

**Nếu hỏi 'Bạn sẽ cải thiện CI/CD như thế nào?':**
> "Tôi muốn thêm GitHub Actions để: (1) chạy PHPUnit tests trước khi merge, (2) lint code tự động, (3) chỉ deploy lên production sau khi tests pass. Với frontend, thêm build check và Lighthouse CI để đảm bảo performance không giảm."

---

## 6. Điểm Mạnh Kỹ Thuật

### Những điểm tự tin nói trong phỏng vấn

**1. Kiến trúc tách biệt Frontend/Backend**
> "Tôi thiết kế theo mô hình API-first: backend là pure REST API, frontend là React SPA độc lập. Hai phần có thể deploy, scale, và develop độc lập nhau."

**2. Token-based Authentication**
> "Implement Sanctum token auth từ đầu, hiểu rõ flow từ login → token generation → Bearer header → middleware verification. Xử lý được cả CORS cross-domain issue."

**3. Cloud Integration**
> "Tích hợp Cloudinary cho media upload — không lưu file trên server (stateless), dùng URL transformation để resize ảnh on-the-fly. Kinh nghiệm với third-party API."

**4. Drag & Drop UX**
> "Implement drag-drop ordering cho course content sử dụng `@hello-pangea/dnd` — xử lý optimistic update, sync với backend API sau khi drop."

**5. Multi-platform Deployment**
> "Deploy production thực sự: Render (Docker backend) + Railway (MySQL) + Cloudinary (media) + Vercel (frontend). Hiểu được environment configuration, database migration trên production."

**6. Activity Tracking**
> "Thiết kế schema để track từng lesson user đã xem, completion status, và resume từ bài cuối — tương tự Netflix's continue watching feature."

**7. Internationalization**
> "Tích hợp i18next ngay từ đầu — text không hardcode, sẵn sàng mở rộng thêm ngôn ngữ."

**8. Database Design**
> "Normalize đúng cách với 12 tables, hiểu quan hệ 1:N và N:M (users-courses qua enrollments). Dùng Eloquent với eager loading để tránh N+1 query problem."

---

## 7. Điểm Yếu & Câu Hỏi Khó

### Câu hỏi khó có thể bị hỏi

---

**Q: "Project không có unit test, sao bạn đảm bảo code chạy đúng?"**

Câu trả lời an toàn:
> "Đây là điểm tôi nhận ra sau khi hoàn thành project. Hiện tại tôi test thủ công các API endpoint bằng Postman và test giao diện trên browser. Nhưng tôi hiểu đây là thiếu sót lớn — với Laravel có PHPUnit sẵn, tôi muốn thêm feature test cho các endpoint quan trọng như auth và enrollment. Bài học: nên viết test ngay từ đầu, không phải sau khi xong."

---

**Q: "Token không có expiry — security risk không?"**

Câu trả lời an toàn:
> "Đúng, đây là điểm tôi biết cần cải thiện. Sanctum hỗ trợ cấu hình `expiration` trong config/sanctum.php. Trong production thực tế, tôi sẽ đặt expiry 24h-7 ngày kèm refresh token mechanism. Hiện tại workaround là user phải logout thủ công để revoke token."

---

**Q: "Tại sao dùng cả Bootstrap lẫn Tailwind? Không conflict CSS sao?"**

Câu trả lời an toàn:
> "Có thể xảy ra conflict về specificity. Bootstrap dùng class như `.btn`, Tailwind dùng utility class. Tôi đã cẩn thận phân chia — Bootstrap cho layout component phức tạp (modal, card), Tailwind cho custom spacing/color. Về lý tưởng, production app nên chọn một trong hai. Đây là quyết định kỹ thuật tôi sẽ cân nhắc kỹ hơn nếu làm lại."

---

**Q: "API không có pagination, nếu có 10,000 khóa học thì sao?"**

Câu trả lời an toàn:
> "Đây là scalability issue tôi nhận ra. Laravel có built-in `paginate()` method — thay `get()` bằng `paginate(20)` là xong phần backend. Frontend cần thêm 'Load more' button hoặc infinite scroll. Tôi biết cách fix nhưng chưa implement vì project còn nhỏ."

---

**Q: "Tại sao không dùng Next.js thay vì React thuần?"**

Câu trả lời an toàn:
> "Next.js có lợi thế SSR và SEO tốt hơn — quan trọng cho trang course public. React thuần phù hợp hơn ở giai đoạn đầu vì tôi quen với nó và muốn tập trung vào business logic. Nếu SEO là yêu cầu quan trọng, tôi sẽ cân nhắc Next.js hoặc dùng React với pre-rendering."

---

**Q: "Validation chỉ ở frontend có đủ không?"**

Câu trả lời an toàn:
> "Không, client-side validation chỉ là UX enhancement — bất kỳ ai có Postman đều có thể bypass. Backend phải luôn validate lại. Trong project này, Laravel validate ở controller trước khi xử lý. Đây là 'defense in depth' — validate ở cả 2 tầng."

---

## 8. Câu Hỏi Phỏng Vấn & Câu Trả Lời Mẫu

### 10 Câu Hỏi Kỹ Thuật Cơ Bản

---

**Q1: Hãy giải thích kiến trúc tổng quan của dự án này.**

**Câu trả lời:**
> "Dự án có kiến trúc tách biệt giữa frontend và backend. Backend là Laravel REST API deploy trên Render, database MySQL trên Railway. Frontend là React SPA deploy trên Vercel. Hai phần giao tiếp qua HTTP với JSON format. Media như ảnh và video được lưu trên Cloudinary — không lưu trên server để tránh mất dữ liệu khi restart.
>
> Tôi chọn kiến trúc này vì nó phù hợp với mô hình phát triển hiện đại: frontend và backend team có thể làm việc độc lập, và mỗi phần có thể scale riêng nếu cần."

---

**Q2: Authentication trong dự án hoạt động như thế nào?**

**Câu trả lời:**
> "Tôi dùng Laravel Sanctum với token-based authentication. Khi user login, server tạo personal access token và trả về. Frontend lưu token vào localStorage. Mỗi API request sau đó gửi kèm `Authorization: Bearer {token}` trong header.
>
> Server dùng middleware `auth:sanctum` để verify token — tìm trong bảng `personal_access_tokens`, nếu hợp lệ thì cho phép request đi tiếp. Khi logout, token bị xóa khỏi database nên không thể dùng lại được."

---

**Q3: Giải thích cách drag-and-drop ordering hoạt động.**

**Câu trả lời:**
> "Tôi dùng thư viện `@hello-pangea/dnd`. Khi user kéo thả để sắp xếp chapter hoặc lesson, thư viện tự xử lý animation và cập nhật UI ngay lập tức. Sau khi drop, tôi lấy mảng IDs theo thứ tự mới và gọi API `POST /sort-chapters` với payload là array các IDs.
>
> Backend nhận mảng đó, loop qua và update `sort_order` field trong database. Như vậy UI responsive ngay (optimistic update) và data được persist xuống DB."

---

**Q4: Tại sao chọn Cloudinary cho media storage?**

**Câu trả lời:**
> "Ba lý do chính: Thứ nhất, server của tôi trên Render free tier không có persistent storage — nếu lưu local thì file sẽ mất khi container restart. Thứ hai, Cloudinary tự động serve ảnh qua CDN toàn cầu, load nhanh hơn server của tôi. Thứ ba, tính năng URL transformation rất tiện — chỉ cần thêm `w_750,h_450,c_fill` vào URL là ảnh tự động resize, không cần code xử lý ảnh phía server."

---

**Q5: Bạn xử lý CORS như thế nào?**

**Câu trả lời:**
> "Vì frontend (Vercel) và backend (Render) ở 2 domain khác nhau, trình duyệt sẽ block request nếu không có CORS headers. Tôi cấu hình trong `config/cors.php` của Laravel: chỉ cho phép request từ FRONTEND_URL, cho phép tất cả HTTP methods, và bật `credentials: true` để cookie có thể gửi kèm.
>
> Khi deploy, tôi set environment variable `FRONTEND_URL` đúng với domain Vercel. Trong local dev, thêm `localhost:5173` vào allowed origins."

---

**Q6: Activity tracking trong learning flow hoạt động thế nào?**

**Câu trả lời:**
> "Tôi có bảng `activities` lưu từng interaction của user với lesson. Khi user mở một bài học, frontend gọi `POST /save-activity` — backend tạo hoặc update record với `is_last_watched = yes` và reset bài trước. Khi user nhấn 'Mark complete', gọi `POST /mark-as-complete` để set `is_completed = yes`.
>
> Khi user quay lại khóa học, frontend tìm bài có `is_last_watched = yes` để auto-resume — giống tính năng 'Continue watching' của Netflix."

---

**Q7: Validation được xử lý thế nào ở project này?**

**Câu trả lời:**
> "Tôi có validation ở cả 2 tầng. Frontend dùng React Hook Form để validate form ngay khi nhập — hiển thị lỗi ngay lập tức, không cần request server. Ví dụ: email format check, password minimum length.
>
> Backend dùng Laravel's built-in validator trong controller — luôn validate lại dù frontend đã kiểm tra. Lý do: client-side validation có thể bị bypass bằng Postman hoặc sửa JavaScript. Server là tuyến phòng thủ cuối cùng."

---

**Q8: Database được thiết kế như thế nào? Giải thích các quan hệ chính.**

**Câu trả lời:**
> "Có 3 quan hệ chính:
>
> Một: `users` và `courses` — 1 user tạo nhiều courses (1:N).
> Hai: `courses`, `chapters`, `lessons` — cascade structure, course có nhiều chapter, mỗi chapter có nhiều lesson.
> Ba: `users` và `courses` qua bảng `enrollments` — đây là N:M relationship. 1 student có thể enroll nhiều course, 1 course có nhiều student.
>
> Ngoài ra có `activities` để track tiến độ học — biết user nào đã xem bài nào, hoàn thành chưa."

---

**Q9: Tại sao dùng React Context thay vì Redux?**

**Câu trả lời:**
> "Project này chỉ cần 2 global state: thông tin user đăng nhập và theme. Redux phù hợp cho app phức tạp với nhiều reducer, middleware, và state update phức tạp. Context API đủ dùng cho nhu cầu đơn giản này, ít boilerplate hơn, không cần thêm dependency.
>
> Tuy nhiên nếu app lớn hơn — ví dụ thêm notification system, shopping cart — tôi sẽ xem xét Zustand hoặc Redux Toolkit vì chúng handle performance tốt hơn khi state update thường xuyên."

---

**Q10: Docker được dùng thế nào trong dự án?**

**Câu trả lời:**
> "Tôi viết Dockerfile cho backend sử dụng image `php:8.2-apache`. Dockerfile cài các PHP extension cần thiết (pdo, pdo_mysql, zip), cài Composer để quản lý PHP packages, enable Apache mod_rewrite cho Laravel routing.
>
> Khi Render build project, nó đọc Dockerfile và tạo container. `docker-entrypoint.sh` chạy `php artisan migrate --force` trước khi start Apache — đảm bảo database schema luôn up-to-date mỗi khi deploy mới."

---

### 10 Câu Hỏi Follow-up Sâu Hơn

---

**FQ1: N+1 query problem trong Eloquent là gì? Dự án của bạn có gặp không?**

**Câu trả lời:**
> "N+1 problem xảy ra khi query 1 lần lấy danh sách, rồi N lần nữa cho từng item để lấy related data. Ví dụ: query 10 courses, rồi mỗi course lại query thêm để lấy enrollments_count — tổng cộng 11 queries.
>
> Trong project, tôi dùng Eloquent eager loading: `Course::withCount('enrollments')->withSum('reviews', 'rating')->get()` — tất cả data lấy trong 1-2 queries thay vì N+1. Laravel cũng có Laravel Debugbar để phát hiện vấn đề này khi dev."

---

**FQ2: Token lưu trong localStorage có an toàn không? Có vấn đề gì?**

**Câu trả lời:**
> "localStorage dễ bị XSS (Cross-Site Scripting) attack — nếu site có XSS vulnerability, attacker có thể đọc token bằng JavaScript. Giải pháp tốt hơn là dùng HttpOnly cookie — JavaScript không đọc được, chỉ browser tự gửi.
>
> Tuy nhiên với project này, frontend và backend khác domain nên HttpOnly cookie cần cấu hình SameSite=None + Secure — khá phức tạp. localStorage là trade-off giữa security và simplicity. Để giảm risk, quan trọng là phải ngăn XSS bằng cách không render raw HTML từ user input."

---

**FQ3: Nếu cần thêm role 'Admin', bạn sẽ thiết kế thế nào?**

**Câu trả lời:**
> "Tôi sẽ thêm column `role` (enum: student, instructor, admin) vào bảng `users`. Sau đó tạo middleware `EnsureRole::class` để kiểm tra role. Trong routes, tạo group riêng với middleware đó.
>
> Ngoài ra tạo admin panel riêng — có thể là namespace `/admin` với controller AdminCourseController, AdminUserController. Frontend cũng cần route guard kiểm tra role trước khi cho vào trang admin."

---

**FQ4: Tại sao database local là SQLite nhưng production là MySQL?**

**Câu trả lời:**
> "SQLite là file-based database — không cần cài server, setup ngay lập tức cho local development. Rất tiện khi cần dev nhanh hoặc chạy trên máy mới.
>
> Production dùng MySQL vì: hiệu năng tốt hơn với concurrent connections, hỗ trợ full-text search tốt hơn, Railway cung cấp managed MySQL dễ backup và scale. Config trong backend tự detect: nếu có `MYSQL_PUBLIC_URL` thì dùng MySQL, nếu không thì fallback SQLite."

---

**FQ5: Làm sao để handle file upload lớn (video bài giảng)?**

**Câu trả lời:**
> "Frontend dùng FilePond để upload file với progress bar — user thấy tiến độ upload. Backend nhận file và stream trực tiếp lên Cloudinary thay vì lưu temp file.
>
> Vấn đề tiềm ẩn: PHP có `upload_max_filesize` và `post_max_size` giới hạn — cần tăng trong php.ini. Với video lớn hơn, tốt hơn là dùng Cloudinary's direct upload (upload thẳng từ browser lên Cloudinary, bypass server) — giảm tải cho server và không bị timeout."

---

**FQ6: React 19 có features gì mới mà bạn dùng trong project?**

**Câu trả lời:**
> "React 19 cải thiện server components và Actions API. Trong project này tôi chủ yếu dùng React 18 features như hooks, concurrent features. React 19 chạy ổn định hơn với React Router v7.
>
> Thành thật mà nói, tôi chọn React 19 vì đây là phiên bản mới nhất lúc bắt đầu project — nhưng tôi chưa khai thác hết các features mới như Server Actions. Đây là area tôi muốn tìm hiểu thêm."

---

**FQ7: Khi hai user cùng sắp xếp lại chapter cùng lúc, có conflict không?**

**Câu trả lời:**
> "Đây là race condition tiềm ẩn. Hiện tại không có optimistic locking — user cuối cùng save sẽ thắng (last-write-wins). Với LMS thường chỉ instructor của course đó mới sort được, nên conflict ít xảy ra trong thực tế.
>
> Giải pháp đúng: thêm `updated_at` check (optimistic lock) — trước khi update, kiểm tra `updated_at` có khớp không. Nếu không khớp thì báo conflict cho user. Hoặc dùng WebSocket (Laravel Broadcasting) để real-time sync."

---

**FQ8: Làm sao để improve SEO cho trang course listing?**

**Câu trả lời:**
> "React SPA có vấn đề lớn về SEO — crawler của Google thấy trang trống vì content render bằng JavaScript. Giải pháp:
>
> 1. Chuyển sang Next.js với SSR/SSG — trang được pre-render thành HTML
> 2. Hoặc thêm React Helmet để quản lý meta tags (title, description, og:image)
> 3. Dùng prerendering service như react-snap
>
> Hiện tại project chưa optimize SEO — đây là limitation của client-side rendering thuần."

---

**FQ9: Nếu Cloudinary down, app của bạn ảnh hưởng thế nào?**

**Câu trả lời:**
> "Ảnh và video sẽ không hiển thị được — đây là single point of failure cho media. Course text content vẫn load bình thường.
>
> Mitigation strategies:
> 1. Có fallback image khi Cloudinary URL 404 (onError handler trên img tag)
> 2. Model accessor đã có logic fallback về local uploads nếu URL không phải Cloudinary format
> 3. Monitor bằng UptimeRobot
>
> Long-term: cân nhắc dùng multiple CDN hoặc có S3 backup. Với project scale hiện tại, Cloudinary's 99.9% uptime SLA là chấp nhận được."

---

**FQ10: Bạn sẽ thêm tính năng gì nếu có thêm 1 tháng?**

**Câu trả lời:**
> "Theo thứ tự ưu tiên:
>
> 1. **Pagination** cho course listing — thiết yếu cho scalability
> 2. **Unit tests** với PHPUnit cho các API endpoint quan trọng
> 3. **Course search** với full-text search (MySQL FULLTEXT hoặc Meilisearch)
> 4. **Payment integration** — Stripe hoặc PayPal để bán khóa học
> 5. **Certificate** khi hoàn thành khóa học — PDF generation bằng `barryvdh/laravel-dompdf`
>
> Tôi ưu tiên testing và pagination vì đây là technical debt cần trả sớm nhất."

---

## Phụ Lục: Cheat Sheet Công Nghệ

| Khi hỏi về | Key points cần nhớ |
|-----------|-------------------|
| Laravel | MVC, Eloquent ORM, Sanctum auth, migrations, artisan CLI |
| React | SPA, hooks, Context API, component lifecycle, Virtual DOM |
| REST API | HTTP verbs, resource URLs, JSON response, status codes |
| Auth | Token vs Session, Bearer header, localStorage vs Cookie |
| Database | Normalization, N:M relationship (enrollments), foreign keys |
| CORS | Same-origin policy, preflight request, allowed origins |
| Docker | Container, image, Dockerfile, entrypoint, volumes |
| Cloudinary | CDN, URL transformation, upload API, stateless storage |
| Vite | Hot Module Replacement, build bundler, faster than Webpack |
| i18next | Translation keys, language detection, namespace |

---

## Phụ Lục: Từ Vựng Kỹ Thuật (Tiếng Nhật)

| Tiếng Anh | Tiếng Nhật | Cách dùng |
|-----------|-----------|-----------|
| Authentication | 認証 (にんしょう) | ユーザー認証 |
| Authorization | 認可 (にんか) | ロール認可 |
| API endpoint | エンドポイント | APIエンドポイント |
| Database schema | データベーススキーマ | テーブル設計 |
| Migration | マイグレーション | DBマイグレーション |
| Deployment | デプロイ | 本番デプロイ |
| Repository | リポジトリ | Gitリポジトリ |
| Bug fix | バグ修正 | - |
| Pull Request | プルリクエスト / PR | コードレビュー |
| Technical debt | 技術的負債 | - |

---

*Last updated: 2026-03-01 | Project: LMS E-Learning Platform*
*Stack: Laravel 12 + React 19 + MySQL + Cloudinary + Docker*
