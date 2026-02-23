import React from "react";
import { useTranslation } from "react-i18next";

const Footer = () => {
  const { t: trans } = useTranslation();
  return (
    <footer>
      <div className="pt-5 container mt-5">
        <div className="row pb-3 gy-4 justify-content-center">
          <div className="col-lg-3 col-12">
            <div className="col-lg-12 col-md-6 col-12 pe-lg-5">
              <h2>LMS</h2>
              <p>{trans("footer.description")}</p>
            </div>
          </div>

          <div className="col-lg-3 col-md-6 col-12">
            <h2>{trans("footer.popularCategories")}</h2>
            <ul>
              <li>
                <a href="#">{trans("footer.categories.newEmployee")}</a>
              </li>
              <li>
                <a href="#">{trans("footer.categories.allEmployee")}</a>
              </li>
              <li>
                <a href="#">{trans("footer.categories.itSecurity")}</a>
              </li>
              <li>
                <a href="#">{trans("footer.categories.healthSafety")}</a>
              </li>
              <li>
                <a href="#">{trans("footer.categories.management")}</a>
              </li>
              <li>
                <a href="#">{trans("footer.categories.skillDevelopment")}</a>
              </li>
            </ul>
          </div>

          <div className="col-lg-3 col-md-6 col-12">
            <h2>{trans("footer.quickLinks")}</h2>
            <ul>
              <li>
                <a href="#">{trans("footer.login")}</a>
              </li>
              <li>
                <a href="#">{trans("footer.register")}</a>
              </li>
              <li>
                <a href="#">{trans("footer.myAccount")}</a>
              </li>
              <li>
                <a href="#">{trans("footer.courses")}</a>
              </li>
            </ul>
          </div>
        </div>
        <div className="row copyright">
          <div className="col-md-12 text-center py-4">
            {trans("footer.copyright")}
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
