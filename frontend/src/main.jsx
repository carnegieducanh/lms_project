import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.jsx'
import 'bootstrap/dist/css/bootstrap.min.css'
import './assets/style.scss'
import { AuthProvider } from './components/context/Auth.jsx'
import { ThemeProvider } from './components/context/Theme.jsx'
// Import i18n phải đứng trước render để cấu hình xong trước khi app khởi động
import './i18n/index.js'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <ThemeProvider>
      <AuthProvider>
        <App />
      </AuthProvider>
    </ThemeProvider>
  </StrictMode>,
)
