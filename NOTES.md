🔹 :: gọi hàm của class `User::find`
🔹 -> gọi hàm của object `$user->createToken`
🔹 Laravel dùng cả hai nên nhìn nhiều nhưng rất logic
_ví dụ_
`$user = User::find(Auth::user()->id);`
`$token = $user->createToken('token')->plainTextToken;`

# Notes

1️⃣ Dòng bạn hỏi đang làm gì? (Ở file Login.jsx)
`localStorage.setItem("userInfoLms", JSON.stringify(userInfo));`

👉 Viết gọn bằng lời:

Lưu thông tin user (name, id, token) vào bộ nhớ trình duyệt để dùng lại sau

2️⃣ Tách từng phần cho dễ hiểu
🔹 localStorage

Là bộ nhớ sẵn có của trình duyệt

Lưu dữ liệu dạng key – value

Dữ liệu:

Không mất khi reload trang

Không mất khi đóng/mở lại trình duyệt

🔹 .setItem(key, value)
localStorage.setItem("userInfoLms", value);

"userInfoLms" 👉 tên key

value 👉 giá trị cần lưu

🔹 Vì sao phải JSON.stringify(userInfo)?

localStorage chỉ lưu được string ❗

Trong khi userInfo là object:

const userInfo = {
name: result.name,
id: result.id,
token: result.token,
};

👉 Nên phải:

JSON.stringify(userInfo);

= chuyển object → chuỗi JSON

Ví dụ sau khi stringify:

{"name":"Anh","id":1,"token":"1|abcxyz..."}

**Vì sao PHẢI lưu vào localStorage?**

Nếu không lưu:

Reload trang ❌ → mất user

F5 ❌ → mất token

Gọi API ❌ → không có Authorization header

👉 Lưu để:

Giữ trạng thái đăng nhập

Dùng token gọi API sau

# useContext dùng để làm gì?

`const { user } = useContext(AuthContext);`

👉 useContext cho phép component lấy dữ liệu “toàn cục” (global state)
mà KHÔNG cần truyền props qua nhiều tầng

Nói ngắn gọn:

useContext = đọc dữ liệu từ Context

2️⃣ Context là gì (hiểu nhanh)?

Bạn tưởng tượng:

App có 1 kho chung

Kho này chứa:

user đang đăng nhập

token

hàm login / logout

👉 Kho đó chính là AuthContext

# params là gì?

👉 params không phải hàm, mà là object chứa tham số trên URL

Thông thường nó đến từ:

import { useParams } from "react-router-dom";

const params = useParams();
📌 Ví dụ URL
/courses/5/edit

👉 params sẽ là:

{
id: "5"
}

# reset là gì?

👉 reset là hàm của react-hook-form

Nó dùng để:

`Set lại toàn bộ giá trị form (giống như đổ data vào form)`

🔹 reset() dùng khi nào?

Form edit

Dữ liệu đến sau (fetch API)

Cần:

Hiển thị data cũ

Không dùng value={} thủ công

🔹 Đoạn code bạn dùng reset
reset({
title: result.data.title,
category: result.data.category_id,
level: result.data.level_id,
language: result.data.language_id,
description: result.data.description,
sell_price: result.data.price,
cross_price: result.data.cross_price,
});
👉 Nghĩa là:

Đổ dữ liệu từ API vào các input đã register()

3️⃣ Vì sao KHÔNG set defaultValues trực tiếp?
❌ Sai / không hiệu quả
defaultValues: {
title: result.data.title
}

👉 Vì:

result chưa có ngay

API trả về sau render

✅ Cách đúng: dùng reset

Form render trước

API trả về sau

reset() cập nhật lại form

4️⃣ Luồng chạy của đoạn code này
Component render
↓
useForm() khởi tạo
↓
fetch course theo params.id
↓
API trả dữ liệu
↓
reset(data) ← ĐIỂM CHÍNH
↓
Form hiển thị dữ liệu cũ

# [...] (spread operator)?

_ví dụ: const newOutcomes = [...outcomes, result.data];_

Nó có nghĩa:

Lấy toàn bộ phần tử trong outcomes

Trải ra từng phần tử

Thêm result.data vào cuối mảng

Ví dụ:

outcomes = [
{ id: 1, title: "HTML" },
{ id: 2, title: "CSS" }
];

newOutcomes = [
{ id: 1, title: "HTML" },
{ id: 2, title: "CSS" },
{ id: 3, title: "JS" }
];

# useReducer là gì? (hiểu nhanh) (file `ManageChapter.jsx`)

useReducer là một cách quản lý state phức tạp trong React, thường dùng khi:

State là mảng / object lớn

Có nhiều kiểu thao tác: thêm, sửa, xóa, set toàn bộ…

Muốn code rõ ràng, dễ bảo trì hơn useState

Cú pháp tổng quát:

const [state, dispatch] = useReducer(reducer, initialState);

Trong code của bạn:

const [chapters, setChapters] = useReducer(chapterReducer, []);

chapters 👉 state hiện tại (mảng chapter)

setChapters 👉 thực chất là dispatch

chapterReducer 👉 hàm xử lý logic thay đổi state

[] 👉 state ban đầu (chưa có chapter nào)

2️⃣ state là gì?

Trong reducer:

const chapterReducer = (state, action) => {

👉 state chính là giá trị hiện tại của chapters

Ví dụ:

state = [
{ id: 1, title: "Intro" },
{ id: 2, title: "Basic" }
]

⛔ Lưu ý quan trọng:

KHÔNG được sửa trực tiếp state

Phải return ra state mới

3️⃣ action là gì?

action là một object mô tả bạn muốn làm gì với state

Thông thường có dạng:

{
type: "ADD*CHAPTER",
payload: dữ_liệu*đi_kèm
}

Trong code của bạn:

setChapters({
type: "ADD_CHAPTER",
payload: result.data
});

→ nghĩa là:
🗣️ “Ê reducer, thêm một chapter mới vào state nhé”

4️⃣ Phân tích từng case trong reducer
🔹 SET_CHAPTERS
case "SET_CHAPTERS":
return action.payload;

📌 Dùng khi:

Load toàn bộ chapter từ API

Gán lại state mới hoàn toàn

Ví dụ:

setChapters({
type: "SET_CHAPTERS",
payload: dataFromApi
});
🔹 ADD_CHAPTER
case "ADD_CHAPTER":
return [...state, action.payload];

📌 Ý nghĩa:

Giữ lại chapters cũ

Thêm chapter mới vào cuối mảng

Ví dụ state cũ:

[{id:1}]

Sau khi add:

[{id:1}, {id:2}]

👉 Đây chính là case bạn đang dùng trong onSubmit

🔹 UPDATE_CHAPTER
case "UPDATE_CHAPTER":
return state.map((chapter) => {
if (chapter.id === action.payload.id) {
return action.payload;
}
return chapter;
});

📌 Ý nghĩa:

Duyệt qua từng chapter

Chapter nào trùng id thì thay bằng bản mới

Còn lại giữ nguyên

Dùng khi: ✏️ chỉnh sửa chapter

🔹 DELETE_CHAPTER
case "DELETE_CHAPTER":
return state.filter((chapter) => chapter.id != action.payload);

📌 Ý nghĩa:

Xóa chapter theo id

Ví dụ:

setChapters({
type: "DELETE_CHAPTER",
payload: 3
});
🔹 default
default:
return state;

📌 Phòng hờ:

Nếu type không hợp lệ

Trả lại state cũ, tránh crash app

5️⃣ Liên hệ trực tiếp với onSubmit

Đoạn quan trọng:

setChapters({
type: "ADD_CHAPTER",
payload: result.data
});

Luồng chạy thực tế:

1️⃣ API tạo chapter thành công
2️⃣ Server trả về result.data
3️⃣ Dispatch action "ADD_CHAPTER"
4️⃣ Reducer nhận:

state = chapters hiện tại
action.payload = chapter mới

5️⃣ Reducer return state mới
6️⃣ React re-render UI 🎉

➡️ Không cần gọi lại API để load danh sách

6️⃣ Tóm tắt ngắn gọn (dễ nhớ)
Thành phần Vai trò
state Dữ liệu hiện tại (chapters)
action Mô tả hành động muốn làm
type Xác định làm gì
payload Dữ liệu đi kèm
reducer Nơi xử lý logic thay đổi state
dispatch (setChapters) Gửi yêu cầu thay đổi
