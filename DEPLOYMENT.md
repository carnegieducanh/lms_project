# Hướng dẫn Deploy LMS Project (Free)

Dự án được deploy với:
- **Backend (Laravel API):** Render
- **Database (MySQL):** Railway
- **Storage (Ảnh/Video):** Cloudinary
- **Frontend (React):** Vercel

---

## Tổng quan các bước

1. [Chuẩn bị mã nguồn](#1-chuẩn-bị-mã-nguồn)
2. [Database – Railway](#2-database--railway)
3. [Storage – Cloudinary](#3-storage--cloudinary)
4. [Backend – Render](#4-backend--render)
5. [Frontend – Vercel](#5-frontend--vercel)
6. [Kết nối và kiểm tra](#6-kết-nối-và-kiểm-tra)

---

## 1. Chuẩn bị mã nguồn

### 1.1 Đẩy code lên GitHub

- Tạo repository trên [GitHub](https://github.com/new).
- Trong thư mục dự án, chạy:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

- **Lưu ý:** Đảm bảo file `.env` **không** được commit (đã có trong `.gitignore`). Các biến môi trường sẽ cấu hình trực tiếp trên từng nền tảng.

---

## 2. Database – Railway

### 2.1 Tạo tài khoản và project

1. Vào [railway.app](https://railway.app), đăng nhập (GitHub khuyến nghị).
2. **New Project** → chọn **Deploy from GitHub repo** hoặc **Empty Project**.
3. Trong project: **Add Service** → **Database** → chọn **MySQL**.

### 2.2 Lấy thông tin kết nối

1. Click vào service **MySQL** vừa tạo.
2. Mở tab **Variables** hoặc **Connect**.
3. Ghi lại (hoặc copy):
   - `MYSQL_HOST` (hoặc `host`) mysql.railway.internal
   - `MYSQL_PORT` (thường `3306`) 3306
   - `MYSQL_DATABASE` railway
   - `MYSQL_URL` mysql://root:LYkLAGpMdcjdsftRypIUSABqVHmfzEhR@mysql.railway.internal:3306/railway
   - `MYSQL_USER` root
   - `MYSQL_PASSWORD` LYkLAGpMdcjdsftRypIUSABqVHmfzEhR
   - `MYSQL_PUBLIC_URL` LYkLAGpMdcjdsftRypIUSABqVHmfzEhR
   - **Connection URL** dạng:  
     `mysql://user:password@host:port/railway`

### 2.3 Tạo database và user (nếu Railway chưa tạo sẵn)

- Nhiều template Railway đã tạo sẵn database và user; bạn chỉ cần copy biến từ tab **Variables**.
- Nếu dùng **MySQL Plugin**, có thể có biến `DATABASE_URL`. Laravel có thể dùng trực tiếp `DB_URL` hoặc tách ra `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`.

Bạn sẽ dùng các giá trị này khi cấu hình **Backend trên Render** (bước 4).

---

## 3. Storage – Cloudinary

### 3.1 Tạo tài khoản Cloudinary

1. Đăng ký tại [cloudinary.com](https://cloudinary.com) (free tier đủ dùng).
2. Vào **Dashboard** → **Settings** (hoặc **Account Details**).

### 3.2 Lấy API credentials
CLOUDINARY_URL=cloudinary://<your_api_key>:<your_api_secret>@dxxfokthl


Trong **Dashboard** ghi lại:

- **Cloud Name** dxxfokthl
- **API Key** E-AleqfKjE1I-3YqQI9jSei0BpQ
- **API Secret** 631712297913183

(Ở mục **Product Environment Credentials**.)

### 3.3 Package Cloudinary (đã có trong dự án)

Dự án đã khai báo `cloudinary-labs/cloudinary-laravel` trong `backend/composer.json`. Khi deploy, Render sẽ chạy `composer install` trong Docker nên không cần cài tay. Nếu bạn chạy local và chưa cài, trong thư mục `backend`:

```bash
cd backend
composer install
php artisan vendor:publish --tag=cloudinary-config
```

Cấu hình trong `backend/.env` (và thêm vào **Environment Variables** trên Render):

```env
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret
```

Code trong project đã hỗ trợ: khi có các biến Cloudinary, ảnh khóa học và video bài học sẽ upload lên Cloudinary; khi không có (local), vẫn dùng lưu local như hiện tại.

---

## 4. Backend – Render

### 4.1 Tạo Web Service

1. Vào [render.com](https://render.com), đăng nhập (GitHub).
2. **New +** → **Web Service**.
3. Kết nối repo GitHub của bạn, chọn repository dự án.
4. Cấu hình:
   - **Name:** `lms-backend` (hoặc tên bạn muốn).
   - **Region:** chọn gần user (ví dụ Singapore).
   - **Branch:** `main`.
   - **Root Directory:** **`backend`** (bắt buộc vì mã Laravel nằm trong thư mục `backend`; Dockerfile nằm tại `backend/Dockerfile`).
   - **Runtime:** **Docker** (Dockerfile đã có sẵn trong `backend`).
   - **Instance Type:** **Free**.

   Nếu bạn dùng **render.yaml** (Blueprint) ở root repo, đã cấu sẵn `rootDir: backend`; chỉ cần connect repo và Render sẽ đọc file đó.

### 4.2 Biến môi trường (Environment Variables)

Trong **Environment** của Web Service, thêm (key = name, value = giá trị):

| Key | Mô tả | Ví dụ |
|-----|--------|-------|
| `APP_NAME` | Tên app | `LMS` |
| `APP_ENV` | Môi trường | `production` |
| `APP_DEBUG` | Bật debug (nên tắt) | `false` |
| `APP_KEY` | Laravel app key | `base64:xxx` (tạo bằng `php artisan key:generate`) |
| `APP_URL` | URL backend trên Render | `https://lms-backend.onrender.com` (đúng URL service của bạn) |
| `FRONTEND_URL` | URL frontend trên Vercel (để CORS) | `https://your-app.vercel.app` |
| `DB_CONNECTION` | Loại DB | `mysql` |
| `DB_HOST` | Host MySQL từ Railway | giá trị từ Railway |
| `DB_PORT` | Port MySQL | `3306` |
| `DB_DATABASE` | Tên database | từ Railway |
| `DB_USERNAME` | User MySQL | từ Railway |
| `DB_PASSWORD` | Mật khẩu MySQL | từ Railway |
| `CLOUDINARY_CLOUD_NAME` | Cloud name Cloudinary | từ Cloudinary |
| `CLOUDINARY_API_KEY` | API Key Cloudinary | từ Cloudinary |
| `CLOUDINARY_API_SECRET` | API Secret Cloudinary | từ Cloudinary |
| `SESSION_DRIVER` | Session | `database` |
| `CACHE_STORE` | Cache | `database` |

- **Lưu ý:** `APP_URL` phải là URL thật của Web Service (Render cung cấp sau khi deploy).
- Nếu Railway cung cấp **một chuỗi** kiểu `DATABASE_URL`, bạn có thể dùng package hỗ trợ parse URL hoặc tách thủ công thành `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD` rồi điền vào Render.

### 4.3 Build & Deploy

- Nếu dùng **Docker**: Render sẽ build từ `Dockerfile` trong thư mục gốc của service (ví dụ `backend/Dockerfile` nếu Root Directory là `backend`).
- Sau khi lưu, Render sẽ tự **Build** rồi **Deploy**. Lần đầu có thể mất vài phút.
- Khi xong, bạn có URL dạng: `https://lms-backend.onrender.com`. Dùng URL này làm `APP_URL` và làm base URL cho API (frontend sẽ gọi tới đây).

### 4.4 Chạy migration (lần đầu)

Trên Render, bạn có thể chạy migration bằng **Shell** (nếu Render hỗ trợ) hoặc **Background Worker** một lần:

- Cách đơn giản: trong **Render Dashboard** → service → **Shell** (nếu có), chạy:
  - `php artisan migrate --force`
- Hoặc thêm vào **Build Command** (tạm) để chạy mỗi lần deploy:
  - Trong **Build Command** (nếu không dùng Docker): có thể thêm bước cuối: `php artisan migrate --force` (chỉ nên dùng cẩn thận để tránh chạy trùng).
- Cách tốt hơn: dùng **Render Shell** hoặc **one-off job** (nếu có) để chạy `php artisan migrate --force` một lần sau khi DB đã sẵn sàng.

---

## 5. Frontend – Vercel

### 5.1 Import project

1. Vào [vercel.com](https://vercel.com), đăng nhập (GitHub).
2. **Add New** → **Project**.
3. Import repository GitHub của dự án.
4. Cấu hình:
   - **Framework Preset:** Vite (Vercel thường tự nhận).
   - **Root Directory:** **`frontend`** (bắt buộc — mã React nằm trong thư mục `frontend`).
   - **Build Command:** `npm run build`.
   - **Output Directory:** `dist` (mặc định của Vite).
   - **Install Command:** `npm install`.

### 5.2 Biến môi trường

Trong **Settings** → **Environment Variables** của project Vercel, thêm:

| Key | Value | Môi trường |
|-----|--------|------------|
| `VITE_API_URL` | URL API backend trên Render | Production (và Preview nếu muốn) |

Ví dụ:

- `VITE_API_URL` = `https://lms-backend.onrender.com/api`  
  (không có dấu `/` ở cuối; đúng URL Web Service + `/api`)

Sau khi thêm, **Redeploy** lại project để biến có hiệu lực.

### 5.3 Deploy

- **Deploy** (hoặc push code mới lên branch đã kết nối). Vercel sẽ build và cho bạn URL dạng: `https://your-app.vercel.app`.
- Dùng URL này điền vào biến **`FRONTEND_URL`** trên Render (bước 4.2) để backend cho phép CORS từ frontend.

---

## 6. Kết nối và kiểm tra

### 6.1 CORS

- Backend đã cấu hình CORS dùng `FRONTEND_URL`. Đảm bảo:
  - Trên Render: `FRONTEND_URL` = đúng URL Vercel (ví dụ `https://your-app.vercel.app`).
  - Không thêm dấu `/` ở cuối.

### 6.2 Kiểm tra nhanh

1. **Backend:** Mở `https://your-backend.onrender.com/api/fetch-categories` (hoặc endpoint public bất kỳ). Nếu trả về JSON là backend đã chạy.
2. **Frontend:** Mở `https://your-app.vercel.app`, đăng nhập / xem khóa học. Nếu load được dữ liệu là đã gọi đúng API.
3. **Cloudinary:** Tạo khóa học mới, upload ảnh bìa / video bài học; vào Cloudinary Dashboard → **Media** kiểm tra file đã lên.

### 6.3 Lưu ý Free tier

- **Render (Free):** Service có thể “ngủ” sau khoảng 15 phút không có request; request đầu sau khi ngủ có thể chậm (vài chục giây). Đây là hành vi bình thường của free tier.
- **Railway:** Free tier có giới hạn usage; theo dõi trong dashboard.
- **Cloudinary:** Free tier có giới hạn storage và bandwidth; đủ cho demo và dự án nhỏ.
- **Vercel:** Free tier thường đủ cho frontend cá nhân/demo.

### 6.4 Xử lý lỗi deploy: "Exited with status 1"

Thông báo này nghĩa là container đã chạy nhưng process bên trong thoát với mã lỗi 1. Cần xem **log đầy đủ** để biết lỗi cụ thể:

1. Trên Render: vào service **lms-backend** → tab **Logs** (hoặc **Events** → click vào deploy vừa chạy).
2. Kéo xuống **phần Runtime** (sau khi build xong). Dòng **ngay trước** "Exited with status 1" thường là lỗi thật.

**Một số nguyên nhân thường gặp:**

| Lỗi trong log | Cách xử lý |
|----------------|------------|
| `No application encryption key` / `APP_KEY` | Thêm biến **APP_KEY** trong Environment (chạy `php artisan key:generate --show` ở máy local trong thư mục `backend`, copy chuỗi `base64:...` vào). |
| `SQLSTATE[HY000] [2002]` / Connection refused / Connection timed out | Kiểm tra **MYSQL_PUBLIC_URL**: dùng URL **public** từ Railway (host `*.proxy.rlwy.net`), không dùng `mysql.railway.internal`. Đảm bảo đã thêm biến trên Render. |
| `could not find driver` (MySQL) | Đã có trong Dockerfile (pdo_mysql); nếu vẫn lỗi, kiểm tra lại build. |
| `Class "CloudinaryLabs\..." not found` | Build lại (Composer install); hoặc kiểm tra `composer.json` có `cloudinary-labs/cloudinary-laravel`. |

Sau khi sửa Environment Variables, nhớ **Save** rồi **Manual Deploy** (hoặc push commit) để Render chạy lại.

---

## Tóm tắt URL cần nhớ

| Thành phần | URL mẫu |
|------------|---------|
| Backend (Render) | `https://lms-backend.onrender.com` |
| API base (cho frontend) | `https://lms-backend.onrender.com/api` |
| Frontend (Vercel) | `https://your-app.vercel.app` |
| Database | Chỉ dùng trong biến môi trường (Railway) |
| Storage | Quản lý trên Cloudinary Dashboard |

Sau khi làm đủ các bước trên, bạn đã có thể deploy free dự án LMS với Backend (Render), Database (Railway), Storage (Cloudinary) và Frontend (Vercel). Nếu một bước nào báo lỗi, gửi tên dịch vụ + nội dung lỗi để xử lý chi tiết hơn.
