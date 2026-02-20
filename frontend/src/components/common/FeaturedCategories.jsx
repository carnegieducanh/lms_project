import React, { useEffect, useState } from "react";
import { apiUrl, token } from "./Config";
import { Link } from "react-router-dom";
import { useTranslation } from "react-i18next";

const FeaturedCategories = () => {
  const [categories, setCategories] = useState([]);
  const { t: trans } = useTranslation();

  const fetchCategories = () => {
    fetch(`${apiUrl}/fetch-categories`, {
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
          setCategories(result.data);
        } else {
          console.log("Something went wrong");
        }
      });
  };

  useEffect(() => {
    fetchCategories();
  }, []);
  return (
    <section className="section-2">
      <div className="container">
        <div className="section-title py-3  mt-4">
          <h2 className="h3">{trans("featuredCategories.title")}</h2>
          <p>{trans("featuredCategories.description")}</p>
        </div>
        <div className="row gy-3">
          {categories &&
            categories.map((category) => {
              return (
                <div key={category.id} className="col-6 col-md-6 col-lg-3">
                  <div className="card shadow border-0">
                    <div className="card-body">
                      <Link to={`/courses?category=${category.id}`}>
                        {category.name}
                      </Link>
                    </div>
                  </div>
                </div>
              );
            })}
        </div>
      </div>
    </section>
  );
};

export default FeaturedCategories;
