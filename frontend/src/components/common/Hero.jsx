import React from "react";
import HeroImg from "../../assets/images/hero.png";
import { useTranslation } from "react-i18next";

const Hero = () => {
  const { t: trans } = useTranslation();

  return (
    <section className="section-1">
      <div className="container ">
        <div className="row align-items-center">
          <div className="col-md-6">
            <h1 className="display-3 fw-bold">{trans("hero.title")}</h1>
            <p className="lead">{trans("hero.description")}</p>
            <a href="#courses" className="btn btn-white">
              {trans("hero.exploreCourses")}
            </a>
          </div>
          <div className="col-md-6 text-center">
            <img src={HeroImg} alt="Student Learning" className="img-fluid" />
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;
