**Nội dung rất quan trọng**
_Ghi chú cần nhớ_
**_Cực kỳ quan trọng_**

```md
> ⚠️ Lưu ý: Đoạn code này chỉ chạy trên production

### 🔴 ❗ Chú ý

## 🔴

🔥 Quan trọng
⚠️ Cảnh báo
✅ Đã xong
❌ Không làm
💡 Ý tưởng
🐞 Bug
✨

---
```

✨
npm create vite@latest
Project name:
│ frontend

npm run dev

✨
composer create-project laravel/laravel backend
cd backend
php artisan serve

Vào .env đổi tên `DB_CONNECTION=mysql` và DB_DATABASE=`lms_project`
rồi chạy `php artisan migrate` (👉 Chạy migration để tạo / cập nhật database)

_FRONTEND_
`npm i react-router-dom` 👉 Thư viện routing cho React
_Dùng để tạo SPA (Single Page Application)_
_Cho phép chuyển trang không reload_
`npm install react-hook-form` 👉 Quản lý form trong React (nhẹ – hiệu suất cao)
`npm install react-hot-toast` 👉 Hiển thị thông báo (toast notification)
`npm install react-icons --save` 👉 Thư viện icon cho React
`npm install jodit-react --save` 👉 Rich Text Editor (soạn thảo nội dung)
`npm i react-simple-star-rating` 👉 Component đánh giá sao (rating) ⭐⭐⭐⭐⭐
`npm install -D sass-embedded` 👉 SASS compiler (dev dependency)
`npm i @hello-pangea/dnd` 👉 Drag & Drop (kéo thả)
`npm install react-filepond filepond --save` 👉 Upload file (UI đẹp + mạnh)
`npm install filepond-plugin-image-exif-orientation` 👉 Xoay ảnh đúng chiều (ảnh chụp từ điện thoại)
`npm install filepond-plugin-image-preview` 👉 Preview ảnh trước khi upload
`npm install filepond-plugin-file-validate-type` 👉 Kiểm tra loại file (jpg, png, pdf…)
`npm i react-player` 👉 Phát video / audio đa nền tảng
`npm i react-bootstrap bootstrap`

Xóa file index.css, app.css

Thêm vào App.jsx:
`import { BrowserRouter, Route, Routes } from "react-router-dom"`
<BrowserRouter>
<Routes>
<Route/>
</Routes>
</BrowserRouter>

**FRONTEND**
Pages
Home
Courses
Detail
Login
Register
Checkout
My Courses
Enrolled Courses
Watch Course
Change Password

**BACKEND**

## categories

ví dụ:
php artisan make:model
named: Category (ko có 's')
migration

id
name
status
created_at
updated_at

_Sau khi tạo xong kết thúc bằng câu lệnh `php artisan migrate` để tải lên MYSQL_

---

## languages

id
name
status
created_at
updated_at

## levels

id
name
status
created_at
updated_at

## courses

id
title
user_id
category_id
level_id
language_id
description
price
cross_price
status
is_featured
image
created_at
updated_at

## outcomes

id
course_id
text
sort_order
created_at
update_at

## requirements

id
course_id
text
sort_order
created_at
update_at

## chapters

id
title
course_id
sort_id

_Tạo api_
`php artisan install:api` : dùng để cài đặt nhanh bộ khung cho API (REST API) trong Laravel. Nó sẽ tự tạo ra "personal_access_tokens" ở trong thư mục `migrations` và api.php ở trong thư mục `routes`
Trong quá trình hoàn tất cài đặt, nó ghi là INFO API scaffolding installed. Please add the [Laravel\Sanctum\HasApiTokens] trait to your User model. Vì vậy hãy add vào User.php

_Làm giảm dung lượng IMG phía backend_
`composer require intervention/image`

Phân biệt `form-control` và `form-select`
khi chọn `form-control` thì ko có icon
khi chọn `form-select` thì sẽ có biểu tượng icon mũi tên trỏ xuống

<div>
   <label htmlFor="" className="form-label">
     Status
      </label>
     <select
     {...register("status", {
       required: "The status field is required.",
       })}
      lassName="form-select"
       >
       <option value="1" selected>
         Active
         </option>
        <option value="0">Block</option>
        </select>
  </div>

_Tránh truy cập đường dẫn khi chưa login, ng dùng sẽ được trả về tẩng login_
Tạo file context/Auth.jsx và RequireAuth.jsx ở phía frontend
Sau đó phải thêm vào file main.jsx
<StrictMode>
<AuthProvider>
<App />
</AuthProvider>
</StrictMode>,

**Sử dụng `reset` trong form**
Mục đích của reset(...): cập nhật toàn bộ giá trị form của react-hook-form sau khi dữ liệu course được load từ API — nó gán các giá trị (title, category, sell_price, v.v.) vào các input đã đăng ký.

const {
register,
handleSubmit,
formState: { errors },
reset,
} = useForm({
defaultValues: async () => {
await fetch(`${apiUrl}/courses/${params.id}`, {
method: "GET",
headers: {
"Content-type": "application/json",
Accept: "application/json",
Authorization: `Bearer ${token}`,
},
})
.then((res) => res.json())
.then((result) => {
if (result.status == 200) {
reset({
title: result.data.title,
category: result.data.category_id,
level: result.data.level_id,
language: result.data.language_id,
description: result.data.description,
sell_price: result.data.price,
cross_price: result.data.cross_price,
});

            setCourse(result.data);
          } else {
            console.log("Something went wrong");
          }
        });
    },

});

Tại sao vẫn cần setCourse(result.data): reset chỉ cập nhật giá trị form; setCourse lưu toàn bộ object course vào state để dùng ở các phần khác của UI (ví dụ ManageChapter, EditCover, hiển thị status, v.v.).

So sánh nhanh với setValue: setValue cập nhật từng trường một; reset thay thế toàn bộ giá trị form (và thường đặt lại trạng thái dirty/touched/errors nếu không truyền options).

## $outcomes = Outcome::where('course_id',$request->course_id)

**where('course_id', $request->course_id)** : lọc những record có cột course_id bằng với giá trị course_id được gửi từ request (ví dụ từ form hay query string).

.get() → trả về collection của tất cả record
.first() → trả về 1 record duy nhất (cái đầu tiên)
