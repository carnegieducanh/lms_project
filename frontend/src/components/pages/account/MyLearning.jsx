import React, { useEffect, useState } from "react"
import UserSidebar from "../../common/UserSidebar"
import CourseEnrolled from "../../common/CourseEnrolled"
import Layout from "../../common/Layout"
import Loading from "../../common/Loading"
import { apiUrl, token } from "../../common/Config"

const MyLearning = () => {
    const [enrollments, setEnrollments] = useState([])
    const [loading, setLoading] = useState(true)

    const fetchEnrollments = async () => {
        setLoading(true)
        await fetch(`${apiUrl}/enrollments`, {
            method: "GET",
            headers: {
                "Content-type": "application/json",
                "Accept": "application/json",
                "Authorization": `Bearer ${token}`,
            },
        })
        .then((res) => res.json())
        .then((result) => {
            if (result.status == 200) {
               setEnrollments(result.data)
            } else {
                console.log("Something went wrong")
            }
        })
        .finally(() => {
            setLoading(false)
        })
    }

    useEffect(() => {
        fetchEnrollments()
    },[])

    return (
        <Layout>
            <section className="section-4">
                <div className="container">
                    <div className="row">
                        <div className="d-flex justify-content-between  mt-5 mb-3">
                            <h2 className="h4 mb-0 pb-0">My Learning</h2>
                        </div>
                        <div className="col-lg-3 account-sidebar">
                            <UserSidebar />
                        </div>
                        <div className="col-lg-9">
                            {loading ? (
                                <div className="py-5">
                                    <Loading />
                                </div>
                            ) : (
                                <div className="row gy-4">
                                    {enrollments && enrollments.map(enrollment => {
                                        return (
                                            <CourseEnrolled
                                                enrollment={enrollment}
                                                key={enrollment.id} />
                                        )
                                    })}
                                    {enrollments.length === 0 && (
                                        <div className="col-12 text-center text-muted py-5">
                                            <p>Bạn chưa tham gia khóa học nào.</p>
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

export default MyLearning
