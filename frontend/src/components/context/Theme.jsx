import { createContext, useState, useEffect } from "react";

export const ThemeContext = createContext();

export const ThemeProvider = ({ children }) => {
    // Đọc preference đã lưu từ localStorage, mặc định là light mode
    const savedTheme = localStorage.getItem('appTheme');
    const [darkMode, setDarkMode] = useState(savedTheme === 'dark');

    // Áp dụng data-bs-theme lên <html> mỗi khi darkMode thay đổi
    // Bootstrap 5.3 đọc attribute này để tự động đổi theme cho tất cả components
    useEffect(() => {
        const theme = darkMode ? 'dark' : 'light';
        document.documentElement.setAttribute('data-bs-theme', theme);
        localStorage.setItem('appTheme', theme);
    }, [darkMode]);

    const toggleTheme = () => {
        setDarkMode(prev => !prev);
    };

    return (
        <ThemeContext.Provider value={{ darkMode, toggleTheme }}>
            {children}
        </ThemeContext.Provider>
    );
};
