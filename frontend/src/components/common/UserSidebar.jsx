import { FaChartBar, FaDesktop, FaUserLock } from "react-icons/fa";
import { BsMortarboardFill } from "react-icons/bs";
import { MdLogout } from "react-icons/md";
import { Link, useNavigate } from "react-router-dom";
import { AuthContext } from "../context/Auth";
import { FaUser } from "react-icons/fa";
import toast from "react-hot-toast";
import { useTranslation } from "react-i18next";
import { useContext } from "react";

const UserSidebar = () => {
  const { logout } = useContext(AuthContext);
  const navigate = useNavigate();
  const { t: trans } = useTranslation();

  const handleLogout = (e) => {
    e.preventDefault();
    logout();
    toast.success(trans("common.logoutSuccess"));
    navigate("/account/login");
  };

  return (
    <div className="card border-0 shadow-lg">
      <div className="card-body  p-4">
        <ul>
          <li className="d-flex align-items-center">
            <Link to="/account/dashboard">
              <FaChartBar size={16} className="me-2 " />{" "}
              {trans("sidebar.dashboard")}
            </Link>
          </li>

          <li className="d-flex align-items-center">
            <Link to="/account/profile">
              <FaUser size={16} className="me-2 " /> {trans("sidebar.profile")}
            </Link>
          </li>

          <li className="d-flex align-items-center">
            <Link to="/account/my-learning">
              <BsMortarboardFill size={16} className="me-2" />{" "}
              {trans("sidebar.myLearning")}
            </Link>
          </li>
          <li className="d-flex align-items-center">
            <Link to="/account/my-courses">
              <FaDesktop size={16} className="me-2" />{" "}
              {trans("sidebar.myCourses")}
            </Link>
          </li>
          <li className="d-flex align-items-center ">
            <Link to="/account/change-password">
              <FaUserLock size={16} className="me-2" />{" "}
              {trans("sidebar.changePassword")}
            </Link>
          </li>
          <li>
            <Link onClick={handleLogout} to="#" className="text-danger">
              <MdLogout size={16} className="me-2" /> {trans("sidebar.logout")}
            </Link>
          </li>
        </ul>
      </div>
    </div>
  );
};

export default UserSidebar;
