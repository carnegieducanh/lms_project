import React, { useEffect, useState } from 'react'
import Layout from "../../common/Layout"
import { Link } from 'react-router-dom'
import { useForm } from 'react-hook-form'
import UserSidebar from '../../common/UserSidebar'
import { apiUrl, token } from '../../common/Config'
import Loading from '../../common/Loading'
import toast from 'react-hot-toast'
import { useTranslation } from 'react-i18next'

const Profile = () => {
    const { t: trans } = useTranslation()
    const {register, handleSubmit, formState: {errors}, reset, setError} = useForm()
    const [user, setUser] = useState([])
    const [loading, setLoading] = useState(false)

    const fetchUser = async () => {
        setLoading(true)
        await fetch(`${apiUrl}/fetch-user`,{
            method: 'GET',
            headers: {
                'Content-type' : 'application/json',
                'Accept' : 'application/json',
                'Authorization' : `Bearer ${token}`
            }
        })
        .then(res => res.json())
        .then(result => {
            setLoading(false)
            if (result.status == 200) {
               setUser(result.data)
               reset({
                name: result.data.name,
                email: result.data.email,
               })
            } else {
                console.log("Something went wrong")
            }
        });

    }

    const onSubmit = async (data) => {
        await fetch(`${apiUrl}/update-user`,{
            method: 'POST',
            headers: {
                'Content-type' : 'application/json',
                'Accept' : 'application/json',
                'Authorization' : `Bearer ${token}`
            },
            body: JSON.stringify(data)
        })
        .then(res => res.json())
        .then(result => {
            if (result.status == 200) {
               toast.success(result.message)
            } else {
                //console.log("Something went wrong")
                const errors = result.errors
                Object.keys(errors).forEach(field => {
                    setError(field,{message: errors[field][0]})
                })
            }
        });
    }

    useEffect(() => {
        fetchUser()
    },[])

    return (
        <Layout>
             <section className='section-4'>
             <div className='container pb-5 pt-3'>
				<nav aria-label="breadcrumb">
					<ol className="breadcrumb">
						<li className="breadcrumb-item"><Link to="/account">{trans("common.account")}</Link></li>
						<li className="breadcrumb-item active" aria-current="page">{trans("profile.title")}</li>
					</ol>
				</nav>
                <div className='row'>
                    <div className='col-md-12 mt-5 mb-3'>
                        <div className='d-flex justify-content-between'>
                            <h2 className='h4 mb-0 pb-0'>{trans("profile.title")}</h2>
                        </div>
                    </div>
                    <div className='col-lg-3 account-sidebar'>
                        <UserSidebar/>
                    </div>
                    <div className='col-lg-9'>
                        <div className='row'>
                            <div className='col-md-12'>
                                {
                                    loading && <Loading/>
                                }
                                {
                                    !loading &&  <div className='card p-3 border-0 shadow-lg'>
                                        <div className='card-body'>
                                            <form onSubmit={handleSubmit(onSubmit)}>
                                                <div className='mb-3'>
                                                    <label className='form-label'>{trans("profile.nameLabel")}</label>
                                                    <input type='text'
                                                        {
                                                            ...register('name',{
                                                                required: trans("profile.nameRequired")
                                                            })
                                                        }
                                                        className={`form-control ${errors.name && 'is-invalid'}`}
                                                        placeholder={trans("profile.namePlaceholder")} />

                                                        {
                                                            errors.name && <p className='invalid-feedback'>{errors.name?.message}</p>
                                                        }

                                                </div>

                                                <div className='mb-3'>
                                                    <label className='form-label'>{trans("profile.emailLabel")}</label>
                                                    <input type='text'
                                                        {
                                                            ...register('email',{
                                                                required: trans("profile.emailRequired"),
                                                                pattern: {
                                                                    value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i,
                                                                    message: trans("profile.emailInvalid")
                                                                }
                                                            })
                                                        }
                                                        className={`form-control ${errors.email && 'is-invalid'}`}
                                                        placeholder={trans("profile.emailPlaceholder")} />

                                                        {
                                                            errors.email && <p className='invalid-feedback'>{errors.email?.message}</p>
                                                        }

                                                </div>

                                                <button className='btn btn-primary'>{trans("profile.update")}</button>
                                            </form>
                                        </div>
                                    </div>
                                }


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </Layout>
    )
}

export default Profile
