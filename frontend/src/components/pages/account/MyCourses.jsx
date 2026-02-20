import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import UserSidebar from '../../common/UserSidebar'
import EditCourse from '../../common/EditCourse'
import Layout from '../../common/Layout'
import Loading from '../../common/Loading'
import { apiUrl, token } from '../../common/Config'
import { useTranslation } from 'react-i18next'

const MyCourses = () => {
    const { t: trans } = useTranslation()
    const [courses, setCourses] = useState([])
    const [loading, setLoading] = useState(true)

    const fetchCourses = async () => {
        setLoading(true)
        await fetch(`${apiUrl}/my-courses`,{
            method: 'GET',
            headers: {
                'Content-type' : 'application/json',
                'Accept' : 'application/json',
                'Authorization' : `Bearer ${token}`
            }
        })
        .then(res => res.json())
        .then(result => {
            if (result.status == 200) {
                setCourses(result.courses)
            } else {
                console.log("Something went wrong")
            }
        })
        .finally(() => {
            setLoading(false)
        })
    }

    const deleteCourse = async (id) => {
        if (confirm("Are you sure you want to delete?")) {
            await fetch(`${apiUrl}/courses/${id}`,{
                method: 'DELETE',
                headers: {
                    'Content-type' : 'application/json',
                    'Accept' : 'application/json',
                    'Authorization' : `Bearer ${token}`
                }
            })
            .then(res => res.json())
            .then(result => {
                if (result.status == 200) {
                    const newCourses = courses.filter(course => course.id != id)
                    setCourses(newCourses)
                } else {
                    console.log("Something went wrong")
                }
            });
        }
    }

    useEffect(() => {
        fetchCourses()
    },[])

  return (
    <Layout>
      <section className='section-4'>
          <div className='container'>
              <div className='row'>
                  <div className='col-md-12 mt-5 mb-3'>
                      <div className='d-flex justify-content-between'>
                          <h2 className='h4 mb-0 pb-0'>{trans("myCourses.title")}</h2>
                          <Link to="/account/courses/create" className='btn btn-primary'>{trans("myCourses.create")}</Link>
                      </div>
                  </div>
                  <div className='col-lg-3 account-sidebar'>
                      <UserSidebar/>
                  </div>
                  <div className='col-lg-9'>
                      {loading ? (
                          <div className="py-5">
                              <Loading />
                          </div>
                      ) : (
                          <div className='row gy-4'>
                              {courses && courses.map(course => {
                                  return (
                                      <EditCourse
                                          course={course}
                                          deleteCourse={deleteCourse}
                                          key={course.id}
                                      />
                                  )
                              })}
                              {courses.length === 0 && (
                                  <div className="col-12 text-center text-muted py-5">
                                      <p>{trans("myCourses.empty")}</p>
                                  </div>
                              )}
                          </div>
                      )}
                  </div>
              </div>
          </div>
      </section>
    </Layout>
  )
}

export default MyCourses
