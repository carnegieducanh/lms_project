import React, { useEffect, useState } from 'react'
import Modal from 'react-bootstrap/Modal';
import { useForm } from 'react-hook-form';
import { apiUrl, token } from '../../../common/Config';
import toast from 'react-hot-toast';
import { useTranslation } from 'react-i18next';

const CreateLesson = ({showLessonModal,handleCloseLessonModal,course,chapters}) => {
    const { t: trans } = useTranslation();
    const [loading, setLoading] = useState(false);
    const { register, handleSubmit, formState: {errors}, reset} = useForm();

    const onSubmit = async (data) => {
        setLoading(true)
        await fetch(`${apiUrl}/lessons`,{
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
            setLoading(false)
            if (result.status == 200) {
                //setChapters({type: "UPDATE_CHAPTER", payload: result.data})
                toast.success(result.message)     
                reset({
                    chapter: '',
                    lesson: '',
                    status: 1
                })  
                handleCloseLessonModal()         
            } else {
                console.log("Something went wrong")
            }
        });
    }

    
  return (
    <>
      <Modal size='lg' show={showLessonModal} onHide={handleCloseLessonModal}>
            <form onSubmit={handleSubmit(onSubmit)}>
                <Modal.Header closeButton>
                    <Modal.Title>{trans("createLesson.title")}</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <div className='mb-3'>
                        <label htmlFor="" className='form-label'>
                            {trans("createLesson.chapter")}
                        </label>
                        <select
                            {
                                ...register('chapter',{
                                    required: trans("createLesson.chapterRequired")
                                })
                            }
                            className={`form-select ${errors.chapter && 'is-invalid'}` }>
                            <option value="">{trans("createLesson.selectChapter")}</option>
                            {
                                chapters && chapters.map(chapter => {
                                    return (
                                        <option value={chapter.id}>{chapter.title}</option>
                                    )
                                })
                            }
                        </select>
                        {
                            errors.chapter && <p className='invalid-feedback'>{errors.chapter.message}</p>
                        }                                              
                    </div>

                    <div className='mb-3'>
                        <label htmlFor="" className='form-label'>
                            {trans("createLesson.lesson")}
                        </label>
                        <input
                            {
                                ...register('lesson',{
                                    required: trans("createLesson.lessonRequired")
                                })
                            }
                            type="text"
                            className={`form-control ${errors.lesson && 'is-invalid'}` }
                            placeholder={trans("createLesson.lessonPlaceholder")}
                        />
                        {
                            errors.lesson && <p className='invalid-feedback'>{errors.lesson.message}</p>
                        }
                    </div>
                    <div>
                        <label htmlFor="" className='form-label'>
                            {trans("createLesson.status")}
                        </label>
                        <select
                            {
                                ...register('status',{
                                    required: trans("createLesson.statusRequired")
                                })
                            }
                            className='form-select'>
                            <option value="1" selected>{trans("createLesson.active")}</option>
                            <option value="0">{trans("createLesson.block")}</option>
                        </select>
                    </div>
                </Modal.Body>
                <Modal.Footer>
                    <button
                        disabled={loading}
                        className='btn btn-primary'>
                        { loading == false ? trans("common.save") : trans("common.pleaseWait")}
                    </button>
                </Modal.Footer>
            </form>
        </Modal>
    </>
  )
}

export default CreateLesson
