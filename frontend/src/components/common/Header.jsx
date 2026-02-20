import { useContext } from "react";
import { Container, Nav, Navbar, NavDropdown } from "react-bootstrap";
import { useTranslation } from "react-i18next";
import { BsSun, BsMoon } from "react-icons/bs";
import { ThemeContext } from "../context/Theme";

// Danh sách ngôn ngữ hỗ trợ
const LANGUAGES = [
  { code: "en", label: "English", flag: "🇺🇸" },
  { code: "ja", label: "日本語", flag: "🇯🇵" },
];

const Header = () => {
  // useTranslation trả về:
  //   t    — hàm dịch: trans('nav.allCourses') → "All Courses" hoặc "すべてのコース"
  //   i18n — instance i18next để đổi ngôn ngữ, đọc ngôn ngữ hiện tại
  const { t: trans, i18n } = useTranslation();
  const { darkMode, toggleTheme } = useContext(ThemeContext);

  const currentLang = LANGUAGES.find((l) => l.code === i18n.language) || LANGUAGES[0];

  const changeLanguage = (code) => {
    i18n.changeLanguage(code);
    // Lưu vào localStorage để ghi nhớ lựa chọn khi reload trang
    localStorage.setItem("appLanguage", code);
  };

  return (
    <>
      <Navbar expand="md" className="bg-white shadow-lg header py-3">
        <Container>
          <Navbar.Brand href="/">
            <strong>Smart Learning</strong>
          </Navbar.Brand>
          <Navbar.Toggle aria-controls="navbarScroll" />
          <Navbar.Collapse id="navbarScroll">
            <Nav className="me-auto my-2 my-lg-0" navbarScroll>
              <Nav.Link href="/courses">{trans("nav.allCourses")}</Nav.Link>
            </Nav>

            {/* Language Switcher Dropdown */}
            <NavDropdown
              title={
                <span>
                  <span className="me-1">{currentLang.flag}</span>
                  {currentLang.label}
                </span>
              }
              id="language-dropdown"
              align="end"
              className="me-3"
            >
              {LANGUAGES.map((lang) => (
                <NavDropdown.Item
                  key={lang.code}
                  onClick={() => changeLanguage(lang.code)}
                  active={i18n.language === lang.code}
                >
                  <span className="me-2">{lang.flag}</span>
                  {lang.label}
                </NavDropdown.Item>
              ))}
            </NavDropdown>

            {/* Dark Mode Toggle */}
            <button
              onClick={toggleTheme}
              className="btn theme-toggle-btn me-2"
              title={darkMode ? "Switch to Light Mode" : "Switch to Dark Mode"}
            >
              {darkMode ? <BsSun size={20} /> : <BsMoon size={20} />}
            </button>

            <a href="/account/dashboard" className="btn btn-primary">
              {trans("nav.myAccount")}
            </a>
          </Navbar.Collapse>
        </Container>
      </Navbar>
    </>
  );
};

export default Header;
