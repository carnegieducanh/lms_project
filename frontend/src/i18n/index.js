import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';
import en from './locales/en.json';
import ja from './locales/ja.json';

// Đọc ngôn ngữ đã lưu từ localStorage, mặc định là tiếng Anh
const savedLanguage = localStorage.getItem('appLanguage') || 'en';

i18n
  // Kết nối i18next với React thông qua plugin initReactI18next
  .use(initReactI18next)
  .init({
    // Định nghĩa các bản dịch cho từng ngôn ngữ
    resources: {
      en: { translation: en },
      ja: { translation: ja },
    },
    // Ngôn ngữ hiện tại (lấy từ localStorage hoặc mặc định 'en')
    lng: savedLanguage,
    // Ngôn ngữ dự phòng nếu không tìm thấy key dịch
    fallbackLng: 'en',
    interpolation: {
      // React đã tự escape XSS, không cần i18next làm thêm
      escapeValue: false,
    },
  });

export default i18n;
