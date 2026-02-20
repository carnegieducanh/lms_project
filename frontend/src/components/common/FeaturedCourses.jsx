import React, { useEffect, useState } from "react";
import Course from "./Course";
import { apiUrl, token } from "./Config";
import { useTranslation } from "react-i18next";

const FeaturedCourses = () => {
  const [courses, setCourses] = useState([]);
  const { t: trans } = useTranslation();

  const fetchFeaturedCourses = () => {
    fetch(`${apiUrl}/fetch-featured-courses`, {
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
          setCourses(result.data);
        } else {
          console.log("Something went wrong");
        }
      });
  };

  useEffect(() => {
    fetchFeaturedCourses();
  }, []);

  return (
    <section className="section-3 my-5">
      <div className="container">
        <div className="section-title py-3  mt-4">
          <h2 className="h3">{trans("featuredCourses.title")}</h2>
          <p>{trans("featuredCourses.description")}</p>
        </div>
        <div className="row gy-4">
          {courses &&
            courses.map((course) => {
              return (
                <Course
                  key={course.id}
                  course={course}
                  customClasses="col-lg-3 col-md-6"
                />
              );
            })}
        </div>
      </div>
    </section>
  );
};

export default FeaturedCourses;
