import React from 'react'
import Spinner from 'react-bootstrap/Spinner';
import { useTranslation } from 'react-i18next';

const Loading = () => {
  const { t: trans } = useTranslation();
  return (
    <div className='w-100 d-flex justify-content-center align-items-center gap-2 py-3'>
        <Spinner animation="border" role="status" size="sm" />
        <span>{trans("common.loading")}</span>
    </div>
  )
}

export default Loading
