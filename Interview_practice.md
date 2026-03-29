# 職務経歴書 Interview Guide

## Dự án: Hệ thống Quản lý Đào tạo Nội bộ (LMS)

> Phân tích chi tiết để chuẩn bị phỏng vấn Web Engineer (Junior ~ 2 năm kinh nghiệm)

---

# PHẦN 1: GIẢI THÍCH TỪNG DÒNG (Line-by-line Breakdown)

---

## 1.1 案件概要 (Tổng quan dự án)

### "社員向け研修コンテンツおよび受講進捗を管理するための社内Webアプリケーションを新規開発"

> Phát triển mới ứng dụng Web nội bộ để quản lý nội dung đào tạo nhân viên và tiến độ học tập

**Ý nghĩa kỹ thuật:**

- Đây là một **LMS (Learning Management System)** - hệ thống quản lý học tập
- "新規開発 (phát triển mới)" = bắt đầu từ 0, không kế thừa code cũ → thể hiện bạn tham gia toàn bộ vòng đời dự án
- "社内 (nội bộ)" = internal tool, không public → bảo mật quan trọng hơn SEO

**Điểm mạnh khi nói câu này:**

- Bạn đã trải qua toàn bộ quá trình từ thiết kế đến deploy
- Hiểu được domain knowledge (nghiệp vụ đào tạo doanh nghiệp)

---

### "バックエンドとフロントエンドを完全に分離したアーキテクチャで設計・構築"

> Thiết kế và xây dựng theo kiến trúc tách biệt hoàn toàn giữa Backend và Frontend

**Ý nghĩa kỹ thuật:**
Đây là kiến trúc **Decoupled (hay Headless)** — Backend chỉ trả về JSON qua API, Frontend nhận JSON và render giao diện.

```
[React SPA] <---HTTP/JSON---> [Laravel API] <---> [MySQL]
  (Browser)                   (Server)             (DB)
```

So sánh với kiến trúc **Monolithic (cũ)**:

- Monolithic: Laravel vừa xử lý logic vừa render HTML (Blade template)
- Decoupled: Laravel chỉ là API server, React lo phần giao diện

**Lợi ích của kiến trúc tách biệt:**

| Lợi ích              | Giải thích                               |
| -------------------- | ---------------------------------------- |
| Scalability          | Backend và Frontend có thể scale độc lập |
| Team separation      | Team FE và BE làm việc song song         |
| Flexibility          | Có thể thêm mobile app dùng cùng API     |
| Clear responsibility | Mỗi phần có trách nhiệm rõ ràng          |

**Điểm mạnh:** Câu này thể hiện bạn có tư duy kiến trúc, không chỉ "code cho xong"

---

## 1.2 担当工程 (Các giai đoạn phụ trách)

### "要件整理、基本設計、詳細設計、実装、動作確認、デプロイ"

> Sắp xếp yêu cầu → Thiết kế cơ bản → Thiết kế chi tiết → Triển khai → Kiểm tra hoạt động → Deploy

**Giải thích từng giai đoạn:**

| Giai đoạn | Tiếng Việt         | Nội dung công việc thực tế                  |
| --------- | ------------------ | ------------------------------------------- |
| 要件整理  | Sắp xếp yêu cầu    | Làm rõ "cần làm gì", viết user story        |
| 基本設計  | Thiết kế cơ bản    | Thiết kế DB schema, API endpoints, màn hình |
| 詳細設計  | Thiết kế chi tiết  | Viết logic xử lý cụ thể, sequence diagram   |
| 実装      | Triển khai code    | Viết code backend + frontend                |
| 動作確認  | Kiểm tra hoạt động | Test thủ công các chức năng                 |
| デプロイ  | Deploy             | Đưa code lên môi trường server              |

**Điểm mạnh:** Junior thường chỉ làm "実装" — nếu bạn cũng làm 要件整理 và 基本設計, đây là điểm cộng lớn

---

## 1.3 使用技術 (Công nghệ sử dụng)

### "React、Vite"

- **React**: Thư viện JavaScript để xây dựng UI theo dạng component
- **Vite**: Build tool thế hệ mới (thay thế Create React App)
  - Tốc độ dev server nhanh hơn vì dùng **ES Modules native** thay vì bundle toàn bộ
  - Hot Module Replacement (HMR) gần như tức thì

**Ví dụ thực tế:** Khi bạn chỉnh sửa 1 component, Vite chỉ reload đúng module đó, không reload cả app

---

### "Bootstrap 5 + Tailwind CSS"

- **Bootstrap 5**: CSS framework với các component UI sẵn có (button, card, modal...)
- **Tailwind CSS**: Utility-first CSS framework — viết class trực tiếp trong HTML

**Tại sao dùng cả hai?**

- Bootstrap cho layout và component cơ bản (nhanh)
- Tailwind cho custom style chi tiết (linh hoạt)

> Chú ý: Đây là điểm có thể bị hỏi — "Tại sao không dùng một trong hai?"

---

### "PHP 8.2 + Laravel 12"

- **PHP 8.2**: Version mới với nhiều cải tiến (Fibers, Enums, Readonly Properties)
- **Laravel 12**: Framework PHP theo kiến trúc **MVC**

**MVC là gì?**

```
M = Model      → Tương tác với Database (Eloquent ORM)
V = View       → Giao diện (trong dự án này = React, không dùng Blade)
C = Controller → Nhận request, gọi Model, trả về response
```

**Ví dụ flow một request:**

```
POST /api/courses
  → Router → CourseController@store()
  → Validate request
  → Course::create($data)  <- Model
  → return response()->json($course, 201)
```

---

### "RESTful API"

REST (Representational State Transfer) là kiểu thiết kế API theo quy tắc chuẩn:

| HTTP Method | Endpoint          | Chức năng            |
| ----------- | ----------------- | -------------------- |
| GET         | /api/courses      | Lấy danh sách course |
| GET         | /api/courses/{id} | Lấy 1 course         |
| POST        | /api/courses      | Tạo course mới       |
| PUT/PATCH   | /api/courses/{id} | Cập nhật course      |
| DELETE      | /api/courses/{id} | Xóa course           |

**Nguyên tắc REST quan trọng:**

- **Stateless**: Mỗi request phải tự chứa đủ thông tin (không lưu session server-side)
- **Uniform Interface**: URL đại diện cho resource, không phải action
- Dùng HTTP status code đúng: 200, 201, 400, 401, 403, 404, 500

---

### "Laravel Sanctum"

Là package authentication của Laravel dùng cho **SPA authentication**.

**Cách hoạt động:**

1. User login → Laravel tạo **token** và trả về
2. React lưu token (localStorage hoặc cookie)
3. Mỗi request tiếp theo, React gửi kèm token trong header: `Authorization: Bearer {token}`
4. Laravel kiểm tra token → cho phép hoặc từ chối

**So sánh với Laravel Passport:**

|                   | Sanctum            | Passport      |
| ----------------- | ------------------ | ------------- |
| Use case          | SPA, Mobile        | OAuth2 server |
| Complexity        | Đơn giản           | Phức tạp      |
| Token type        | API token / Cookie | OAuth2 token  |
| Phù hợp dự án này | YES                | NO (overkill) |

---

### "Docker"

**Docker** cho phép đóng gói ứng dụng vào **container** — môi trường độc lập, nhất quán.

**Tại sao quan trọng:**

```
Không có Docker: "Trên máy tôi chạy được mà!" (ác mộng của dev team)
Có Docker: Mọi người dùng cùng môi trường → không có lỗi "works on my machine"
```

**Cấu trúc Docker cơ bản trong dự án:**

```yaml
# docker-compose.yml (ví dụ)
services:
  app: # PHP + Laravel
  nginx: # Web server
  mysql: # Database
```

---

## 1.4 実装機能 (Chức năng đã triển khai)

### "ユーザー登録／ログイン機能"

> Chức năng đăng ký / đăng nhập người dùng

**Kỹ thuật liên quan:**

- Backend: Validation (email format, password length), Hash mật khẩu (bcrypt), Tạo token (Sanctum)
- Frontend: Form handling, lưu token, redirect sau login

**Bảo mật cơ bản đã implement:**

- Password hashing: `Hash::make($password)` — không lưu plain text
- Token-based auth: Không dùng session truyền thống (phù hợp SPA)

---

### "コース／レッスン管理機能 + 受講進捗管理機能"

> Quản lý Course/Lesson + Quản lý tiến độ học

**DB Design cơ bản (ví dụ):**

```
users --< enrollments >-- courses --< lessons
                                      |
                               lesson_progress
                               (user_id, lesson_id, completed_at)
```

**Logic nghiệp vụ:**

- Tính % hoàn thành: `completed_lessons / total_lessons * 100`
- Đánh dấu lesson hoàn thành khi user xem xong

---

### "管理者画面機能"

> Chức năng màn hình quản trị (Admin)

**Kỹ thuật:**

- **Role-based access control**: Phân biệt `admin` và `user`
- Laravel: Middleware kiểm tra role trước khi vào route
- React: Kiểm tra role trước khi render component admin

**Ví dụ middleware:**

```php
// routes/api.php
Route::middleware(['auth:sanctum', 'role:admin'])->group(function () {
    Route::get('/admin/users', [AdminController::class, 'index']);
});
```

---

### "CRUD機能（下書き保存、画像・動画アップロード機能を含む）"

> CRUD + Draft save + Upload ảnh/video

**Draft save (下書き保存):**

- Thêm cột `status` vào bảng courses: `draft | published`
- Chỉ hiển thị content có `status = 'published'` cho học viên

**File Upload:**

- Backend: Validate file type/size, lưu vào storage, trả về URL
- Frontend: FormData để gửi file qua API

```php
// Laravel xử lý upload
$path = $request->file('image')->store('courses', 'public');
return response()->json(['url' => Storage::url($path)]);
```

---

### "多言語対応、ダーク／ライトモード切替（Context API）、トースト通知機能"

> Đa ngôn ngữ, Dark/Light mode (Context API), Toast notification

**Đây là phần UX Enhancement — thể hiện bạn quan tâm đến trải nghiệm người dùng**

**Context API là gì?**
React's built-in state management — chia sẻ state giữa các component mà không cần prop drilling:

```
ThemeContext (dark/light)
  └── App
       ├── Header  (dùng theme)
       ├── Sidebar (dùng theme)
       └── Content (dùng theme)
```

**Multi-language (i18n):**

- Thường dùng thư viện như `react-i18next`
- File JSON cho từng ngôn ngữ: `en.json`, `ja.json`, `vi.json`

---

## 1.5 成果・学んだこと (Kết quả và bài học)

### "LaravelのMVC構造を意識し、責務分離を考慮した設計を実施"

> Thiết kế có ý thức về cấu trúc MVC của Laravel, cân nhắc phân tách trách nhiệm

**Responsibility Separation (責務分離) trong thực tế:**

```php
// BAD: Controller làm quá nhiều việc
class CourseController {
    public function store(Request $request) {
        $data = $request->validate([...]);
        $course = Course::create($data);
        Mail::to($user)->send(new CourseCreated($course)); // gửi email
        ActivityLog::create([...]); // log activity
        return response()->json($course);
    }
}

// GOOD: Controller mỏng, Service lo business logic
class CourseController {
    public function store(Request $request) {
        $course = $this->courseService->create($request->validated());
        return response()->json($course, 201);
    }
}
```

---

### "Dockerを用いて開発環境を構築し、環境差異を防止"

> Xây dựng môi trường phát triển bằng Docker, ngăn chặn sự khác biệt môi trường

**Điểm mạnh:** Hiểu được pain point thực tế của team development

---

### "バリデーションおよび認証処理を実装し、基本的なセキュリティを確保"

> Implement validation và authentication, đảm bảo bảo mật cơ bản

**Bảo mật đã làm:**

- Input validation: Ngăn dữ liệu không hợp lệ vào DB
- Authentication: Chỉ user đã đăng nhập mới truy cập được API
- Authorization: Admin mới xóa/sửa được content
- Password hashing: Không lưu plain text

---

### "RESTful APIの設計手法を習得し、React SPAとの連携実装を通じてFE／BE統合の理解を深めた"

> Học được phương pháp thiết kế RESTful API, hiểu sâu về tích hợp FE/BE qua implement kết nối React SPA

**Điểm mạnh của câu này:** Bạn không chỉ biết làm FE hoặc BE riêng lẻ, mà hiểu cả hai bên hoạt động cùng nhau như thế nào → Full-stack thinking

---

# PHẦN 2: CÁC CÂU HỎI CÓ THỂ BỊ HỎI

---

## 2.1 Về Kiến trúc

**Q1:** Tại sao bạn chọn kiến trúc tách biệt FE/BE thay vì dùng Blade template của Laravel?

**Q2:** Kiến trúc này có nhược điểm gì không?

**Q3:** Nếu project nhỏ hơn, bạn có vẫn chọn kiến trúc này không?

**Q4:** CORS là gì và bạn xử lý nó như thế nào trong dự án?

---

## 2.2 Về Laravel / Backend

**Q5:** MVC là gì? Trong dự án của bạn, mỗi phần đóng vai trò gì?

**Q6:** Laravel Sanctum hoạt động như thế nào? Token được lưu ở đâu?

**Q7:** Validation bạn làm ở đâu? Chỉ ở backend hay cả frontend?

**Q8:** Middleware là gì? Bạn đã dùng middleware nào?

**Q9:** Eloquent ORM là gì? Khác gì với raw SQL?

**Q10:** Tại sao chọn Sanctum mà không phải Passport?

---

## 2.3 Về React / Frontend

**Q11:** Context API là gì? Khác gì với Redux?

**Q12:** SPA là gì? Ưu/nhược điểm so với MPA?

**Q13:** Tại sao dùng cả Bootstrap lẫn Tailwind? Không conflict nhau sao?

**Q14:** Khi token hết hạn, React xử lý như thế nào?

**Q15:** Vite khác gì với Create React App?

---

## 2.4 Về Database

**Q16:** Bạn thiết kế DB schema như thế nào cho chức năng tiến độ học?

**Q17:** Migration trong Laravel là gì?

**Q18:** Khi có nhiều user học cùng lúc, bạn xử lý concurrent access như thế nào?

---

## 2.5 Về Docker

**Q19:** Docker container khác gì với Virtual Machine?

**Q20:** docker-compose.yml của bạn có những service gì?

**Q21:** Nếu muốn thêm một developer mới vào team, họ cần làm gì để setup môi trường?

---

## 2.6 Về Bảo mật

**Q22:** Ngoài validation và auth, bạn có xử lý bảo mật nào khác không?

**Q23:** SQL Injection là gì? Eloquent ORM bảo vệ chống lại nó như thế nào?

**Q24:** XSS là gì? React xử lý nó tự động không?

---

## 2.7 Về Process

**Q25:** Bạn test chức năng như thế nào? Có viết automated test không?

**Q26:** Khi gặp bug, quy trình debug của bạn là gì?

**Q27:** Deploy lên server nào? Quy trình deploy như thế nào?

---

# PHẦN 3: CÁCH TRẢ LỜI MẪU (Answer Strategy)

---

## 3.1 "MVC là gì và bạn dùng nó như thế nào?"

**Câu trả lời tốt:**

> "MVC là mô hình kiến trúc phân chia ứng dụng thành 3 phần với trách nhiệm riêng biệt.
> Trong dự án của tôi: **Model** dùng Eloquent ORM để tương tác với MySQL — ví dụ `Course::create()` hay `$user->courses()->get()`.
> **Controller** nhận HTTP request, validate dữ liệu, gọi Model và trả về JSON response.
> **View** trong trường hợp này không phải Blade mà là React SPA bên frontend.
> Tôi cố gắng giữ Controller gọn nhẹ — nếu logic phức tạp tôi tách ra Service class để dễ maintain."

**Tại sao tốt:** Trả lời đúng định nghĩa + áp dụng vào dự án cụ thể + thể hiện tư duy thiết kế

---

## 3.2 "Tại sao chọn Laravel Sanctum?"

**Câu trả lời tốt:**

> "Dự án này là SPA nên cần token-based authentication. Tôi so sánh Sanctum và Passport — Passport thực chất là một OAuth2 server đầy đủ, phù hợp khi cần cấp token cho third-party application. Còn Sanctum đơn giản hơn, đủ dùng cho SPA internal, và setup nhanh hơn. Vì đây là tool nội bộ không cần OAuth2 flow, Sanctum là lựa chọn hợp lý hơn."

**Tại sao tốt:** Thể hiện bạn đã cân nhắc alternatives, không chọn bừa

---

## 3.3 "Context API khác gì Redux?"

**Câu trả lời tốt:**

> "Context API là tính năng built-in của React, phù hợp để share state đơn giản như theme hay language setting — không cần thêm dependency. Redux mạnh hơn với DevTools, middleware, và quản lý state phức tạp hơn.
> Trong dự án của tôi, tôi dùng Context API cho dark/light mode và ngôn ngữ vì chúng là global preference đơn giản, không cần đến độ phức tạp của Redux."

---

## 3.4 "Khi gặp bug, bạn debug như thế nào?"

**Câu trả lời tốt:**

> "Tôi thường bắt đầu từ log. Backend thì xem `storage/logs/laravel.log` trong Laravel — lỗi thường có stack trace rõ ràng. Frontend thì dùng browser DevTools, xem Console và Network tab để kiểm tra request/response.
> Nếu là logic bug, tôi dùng `dd()` hoặc `Log::info()` ở backend, `console.log()` ở frontend để kiểm tra giá trị tại từng bước.
> Tôi cũng học được rằng đọc error message kỹ trước khi đoán mò giúp tiết kiệm nhiều thời gian."

---

## 3.5 "Tại sao dùng cả Bootstrap lẫn Tailwind?"

**Câu trả lời tốt:**

> "Bootstrap cho tôi các component sẵn có như modal, dropdown, pagination — giúp tiết kiệm thời gian. Tailwind cho phép custom style nhanh mà không cần viết CSS riêng. Thực ra trong dự án production, dùng cả hai có thể tăng bundle size. Nếu làm lại, tôi sẽ cân nhắc chọn một trong hai hoặc dùng headless UI components với Tailwind."

**Tại sao tốt:** Thành thật về trade-off, thể hiện khả năng reflection

---

## 3.6 "CORS là gì? Bạn xử lý như thế nào?"

**Câu trả lời tốt:**

> "CORS — Cross-Origin Resource Sharing — là cơ chế bảo mật của browser ngăn chặn request từ domain khác. Vì frontend React chạy ở `localhost:5173` còn Laravel API ở `localhost:8000`, browser sẽ block request nếu không có CORS header.
> Trong Laravel, tôi config file `config/cors.php` để allow origin từ frontend domain. Chỉ allow đúng origin cần thiết, không dùng wildcard `*` trong production."

---

## 3.7 "SPA có nhược điểm gì không?"

**Câu trả lời tốt:**

> "Có. SPA có một số trade-off:
> Thứ nhất là SEO — vì content được render bằng JavaScript phía client, crawler khó đọc hơn. Nhưng với tool nội bộ thì SEO không quan trọng.
> Thứ hai là First Load chậm hơn vì cần tải toàn bộ JavaScript bundle.
> Thứ ba là logic state management phức tạp hơn so với server-rendered app.
> Trong trường hợp dự án nội bộ này, SPA là lựa chọn phù hợp vì không cần SEO và trải nghiệm người dùng mượt hơn sau lần load đầu."

---

# PHẦN 4: CÁC ĐIỂM CÓ THỂ BỊ BẮT BẺ

---

## 4.1 Điểm yếu tiềm ẩn và cách xử lý

### Không có automated test

**Câu hỏi bẫy:** "Bạn có viết unit test không?"

**Câu trả lời junior thường nghe:**

> "Chưa, tôi chỉ test thủ công..."

**Cách nâng cấp:**

> "Dự án lần này tôi chủ yếu test thủ công qua Postman và browser. Tôi hiểu đây là điểm cần cải thiện — tôi đã bắt đầu tìm hiểu PHPUnit cho Laravel và Jest/Vitest cho React. Trong môi trường team thực tế, tôi muốn áp dụng ít nhất unit test cho business logic quan trọng."

---

### Dùng cả Bootstrap lẫn Tailwind

**Câu hỏi bẫy:** "Hai framework này không conflict nhau sao? Bundle size thế nào?"

**Câu trả lời nâng cấp:**

> "Có thể có conflict ở một số utility class, tôi xử lý bằng cách ưu tiên rõ ràng. Về bundle size, Tailwind có PurgeCSS tự động loại bỏ unused class. Nhưng tôi thừa nhận đây không phải best practice — lý tưởng nhất nên chọn một trong hai cho nhất quán."

---

### Chưa có kinh nghiệm Git workflow trong team

**Câu hỏi:** "Bạn dùng Git như thế nào? Branch strategy?"

**Câu trả lời nâng cấp:**

> "Dự án này tôi làm solo nên chủ yếu commit trên main branch với commit message rõ ràng. Tôi hiểu trong team environment cần Git flow hoặc GitHub flow — tạo feature branch, mở Pull Request, code review trước khi merge. Tôi muốn học và áp dụng workflow này trong môi trường thực tế."

---

### Security chưa đầy đủ

**Câu hỏi đào sâu:** "Ngoài validation và auth, bạn có xử lý Rate Limiting không?"

**Câu trả lời nâng cấp:**

> "Rate limiting tôi chưa implement nhưng Laravel có `ThrottleRequests` middleware sẵn có, chỉ cần thêm vào route group. Về CSRF, với API routes dùng token auth thì không cần CSRF, nhưng cần đảm bảo CORS configuration chỉ allow origin đúng domain. Đây là điểm tôi sẽ bổ sung nếu làm lại."

---

### XAMPP + Docker — tại sao dùng cả hai?

**Câu hỏi phản biện:** "Bạn dùng Docker và XAMPP — vậy thực ra bạn dùng cái nào?"

**Câu trả lời thành thật:**

> "Ban đầu tôi setup với XAMPP vì quen thuộc hơn, sau đó học thêm và migrate sang Docker để có môi trường nhất quán hơn. Cuối cùng dự án có cả hai ở các giai đoạn khác nhau. Nếu làm lại từ đầu, tôi sẽ bắt đầu với Docker ngay từ đầu để nhất quán."

---

## 4.2 Nâng cấp câu trả lời từ Junior lên có tư duy tốt hơn

| Câu trả lời Junior                         | Câu trả lời thể hiện tư duy tốt hơn                                                                  |
| ------------------------------------------ | ---------------------------------------------------------------------------------------------------- |
| "Tôi dùng MVC vì Laravel mặc định như vậy" | "Tôi dùng MVC và cố gắng giữ Controller gọn, tách business logic ra Service class khi cần"           |
| "Tôi dùng Context API vì đơn giản"         | "Tôi chọn Context API vì theme/language là simple global state, không cần complexity của Redux"      |
| "Docker để code chạy được"                 | "Docker để đảm bảo môi trường nhất quán, tránh 'works on my machine'"                                |
| "Tôi implement CRUD"                       | "Tôi thiết kế RESTful endpoints theo resource-based naming, sử dụng đúng HTTP method và status code" |
| "Tôi dùng Sanctum"                         | "Tôi chọn Sanctum vì đủ dùng cho SPA internal, Passport là overkill cho use case này"                |

---

# PHẦN 5: TỔNG KẾT NĂNG LỰC

---

## 5.1 Nhà tuyển dụng sẽ nhìn nhận bạn như thế nào?

**Điểm mạnh rõ ràng:**

- Full-stack capability: Có thể làm cả FE lẫn BE
- End-to-end ownership: Từ thiết kế đến deploy — không chỉ "code theo task"
- Modern tech stack: React + Laravel + Docker là stack phổ biến trong công ty Nhật
- Architecture thinking: Biết đến decoupled architecture, MVC, REST
- UX awareness: Tự thêm dark mode, i18n, toast — thể hiện quan tâm đến người dùng

**Vị trí phù hợp:**

- Junior Web Engineer (FE, BE, hoặc Full-stack)
- Công ty Nhật có product nội bộ hoặc SaaS nhỏ
- Team nhỏ cần người có thể làm nhiều vai trò

---

## 5.2 Điều nên nhấn mạnh khi phỏng vấn

### Nhấn mạnh 1: "Tôi đã làm toàn bộ vòng đời dự án"

Nhiều junior chỉ biết implement task được giao. Bạn đã tham gia từ 要件整理 đến デプロイ — đây là điểm khác biệt lớn.

### Nhấn mạnh 2: "Tôi hiểu tại sao chọn công nghệ đó"

Không chỉ "dùng vì học được" mà giải thích được Sanctum vs Passport, Context vs Redux, lý do tách FE/BE.

### Nhấn mạnh 3: "Tôi có tư duy về trải nghiệm người dùng"

Dark mode, đa ngôn ngữ, toast notification — không ai yêu cầu nhưng bạn tự thêm → thể hiện ownership và initiative.

### Nhấn mạnh 4: "Tôi biết điểm yếu và đang cải thiện"

Thừa nhận chưa có automated test nhưng đang học → thể hiện trung thực và growth mindset, điều công ty Nhật rất coi trọng.

---

## 5.3 Câu mở đầu gợi ý khi giới thiệu dự án (tiếng Nhật)

> "このプロジェクトでは、社員向けの研修管理システムをゼロから設計・開発しました。バックエンドはLaravel、フロントエンドはReactで、REST APIで繋ぐ構成を採用しました。要件定義からデプロイまで一通り担当できたのが大きな学びでした。特に、MVCの責務分離を意識した設計と、RESTful APIの設計を通じて、フロントとバックエンドの連携について深く理解できました。"

**(Dịch):** "Trong dự án này, tôi đã thiết kế và phát triển hệ thống quản lý đào tạo nhân viên từ đầu. Tôi sử dụng Laravel cho backend, React cho frontend, kết nối qua REST API. Điều tôi học được nhiều nhất là được trải nghiệm toàn bộ từ định nghĩa yêu cầu đến deploy. Đặc biệt, việc ý thức về phân tách trách nhiệm trong MVC và thiết kế RESTful API giúp tôi hiểu sâu hơn về sự kết hợp giữa frontend và backend."

---

## 5.4 Checklist chuẩn bị phỏng vấn

- [ ] Giải thích được MVC với ví dụ cụ thể từ dự án
- [ ] Giải thích được Sanctum hoạt động như thế nào step-by-step
- [ ] Vẽ được sơ đồ kiến trúc FE/BE separation đơn giản
- [ ] Giải thích được CORS là gì và cách xử lý
- [ ] Giải thích được Context API với ví dụ dark mode
- [ ] Biết ít nhất 5 HTTP status code và ý nghĩa (200, 201, 400, 401, 403, 404, 500)
- [ ] Trả lời được "tại sao chọn X không phải Y" cho mỗi công nghệ
- [ ] Chuẩn bị câu trả lời về điểm yếu (chưa có automated test, XAMPP+Docker)
- [ ] Luyện câu mở đầu giới thiệu dự án bằng tiếng Nhật
- [ ] Chuẩn bị vẽ sơ đồ DB (users, courses, lessons, progress) nếu được hỏi

---

_File này được tạo để chuẩn bị phỏng vấn Web Engineer tại công ty Nhật Bản._
_Phong cách trả lời: Junior thành thật, có tư duy kỹ sư, biết điểm yếu và đang cải thiện._
