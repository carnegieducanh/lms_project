import React, { useContext } from "react";
import { Link, useNavigate } from "react-router-dom";
import Layout from "../common/Layout";
import { useForm } from "react-hook-form";
import { apiUrl } from "../common/Config";
import toast from "react-hot-toast";
import { AuthContext } from "../context/Auth";
import { useTranslation } from "react-i18next";

const Login = () => {
  const { login } = useContext(AuthContext);
  const navigate = useNavigate();
  const { t: trans } = useTranslation();
  const {
    handleSubmit,
    register,
    formState: { errors },
  } = useForm();

  const onSubmit = async (data) => {
    await fetch(`${apiUrl}/login`, {
      method: "POST",
      headers: {
        "Content-type": "application/json",
        Accept: "application/json",
      },
      body: JSON.stringify(data),
    })
      .then((res) => res.json())
      .then((result) => {
        if (result.status == 200) {
          const userInfo = {
            name: result.name,
            id: result.id,
            token: result.token,
          };
          localStorage.setItem("userInfoLms", JSON.stringify(userInfo));
          login(userInfo);
          toast.success(trans("login.success"));
          navigate("/account/dashboard");
        } else {
          toast.error(result.message);
        }
      });
  };

  return (
    <Layout>
      <div className="container py-5 mt-5">
        <div className="d-flex align-items-center justify-content-center">
          <form onSubmit={handleSubmit(onSubmit)}>
            <div className="card border-0 shadow login">
              <div className="card-body p-4">
                <h3 className="border-bottom pb-3 mb-3">
                  {trans("login.title")}
                </h3>
                <div className="mb-3">
                  <label className="form-label" htmlFor="email">
                    {trans("login.email")}
                  </label>
                  <input
                    {...register("email", {
                      required: trans("login.errors.emailRequired"),
                      pattern: {
                        value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                        message: trans("login.errors.emailInvalid"),
                      },
                    })}
                    type="text"
                    className={`form-control ${errors.email && "is-invalid"}`}
                    placeholder={trans("login.email")}
                  />
                  {errors.email && (
                    <p className="invalid-feedback">{errors.email.message}</p>
                  )}
                </div>

                <div className="mb-3">
                  <label className="form-label" htmlFor="password">
                    {trans("login.password")}
                  </label>
                  <input
                    {...register("password", {
                      required: trans("login.errors.passwordRequired"),
                    })}
                    type="password"
                    className={`form-control ${errors.password && "is-invalid"}`}
                    placeholder={trans("login.password")}
                  />
                  {errors.password && (
                    <p className="invalid-feedback">
                      {errors.password.message}
                    </p>
                  )}
                </div>

                <div className="d-flex justify-content-between align-items-center">
                  <button className="btn btn-primary">
                    {trans("login.btn")}
                  </button>
                  <Link to={`/account/register`} className="text-secondary">
                    {trans("login.registerHere")}
                  </Link>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </Layout>
  );
};

export default Login;
