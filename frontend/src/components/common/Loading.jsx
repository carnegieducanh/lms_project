import React from 'react'
import Spinner from 'react-bootstrap/Spinner';


const Loading = () => {
  return (
    <div className='w-100 d-flex justify-content-center align-items-center gap-2 py-3'>
        <Spinner animation="border" role="status" size="sm" />
        <span>Loading...</span>
    </div>
  )
}

export default Loading
