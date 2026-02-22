import React, { useEffect, useState } from 'react'
import Layout from '../../common/Layout'
import UserSidebar from '../../common/UserSidebar'
import { Link } from 'react-router-dom'
import { useTranslation } from 'react-i18next'
import { apiUrl, token } from '../../common/Config'
import Loading from '../../common/Loading'

const Dashboard = () => {
  const { t: trans } = useTranslation()
  const [stats, setStats] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetch(`${apiUrl}/dashboard-stats`, {
      method: 'GET',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    })
      .then(res => res.json())
      .then(result => {
        setLoading(false)
        if (result.status == 200) {
          setStats(result)
        }
      })
  }, [])
  return (
    <Layout>
        <section className='section-4'>
             <div className='container pb-5 pt-3'>
				<nav aria-label="breadcrumb">
					<ol className="breadcrumb">
						<li className="breadcrumb-item"><Link to="/account">{trans("common.account")}</Link></li>
						<li className="breadcrumb-item active" aria-current="page">{trans("dashboard.title")}</li>
					</ol>
				</nav>
                <div className='row'>
                    <div className='col-md-12 mt-5 mb-3'>
                        <div className='d-flex justify-content-between'>
                            <h2 className='h4 mb-0 pb-0'>{trans("dashboard.title")}</h2>
                        </div>
                    </div>
                    <div className='col-lg-3 account-sidebar'>
                        <UserSidebar/>
                    </div>
                    <div className='col-lg-9'>
                        {loading ? (
                            <Loading />
                        ) : (
                        <div className='row'>
                            <div className='col-md-4'>
                                <div className='card shadow'>
                                    <div className='card-body p-3'>
                                        <h2>{stats?.totalUsers ?? 0}</h2>
                                        <span>{trans("dashboard.totalUsers")}</span>
                                    </div>
                                    <div className='card-footer'>
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                            <div className='col-md-4'>
                                <div className='card shadow'>
                                    <div className='card-body p-3'>
                                        <h2>{stats?.enrolledUsers ?? 0}</h2>
                                        <span>{trans("dashboard.enrolledUsers")}</span>
                                    </div>
                                    <div className='card-footer'>
                                        &nbsp;
                                    </div>
                                </div>
                            </div>
                            <div className='col-md-4'>
                                <div className='card shadow'>
                                    <div className='card-body p-3'>
                                        <h2>{stats?.activeCourses ?? 0}</h2>
                                        <span>{trans("dashboard.activeCourses")}</span>
                                    </div>
                                    <div className='card-footer'>
                                        <Link to="/account/courses">{trans("dashboard.viewCourses")}</Link>
                                    </div>
                                </div>
                            </div>
                        </div>
                        )}
                    </div>
                </div>
            </div>
        </section>
    </Layout>
  )
}

export default Dashboard
