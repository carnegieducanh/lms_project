import React, { useEffect, useState } from "react";
import Modal from "react-bootstrap/Modal";
import { useForm } from "react-hook-form";
import { apiUrl, token } from "../../../common/Config";
import toast from "react-hot-toast";
import { useTranslation } from "react-i18next";

const UpdateOutcome = ({
  outcomeData,
  showOutcome,
  handleClose,
  outcomes,
  setOutcomes,
}) => {
  const { t: trans } = useTranslation();
  const [loading, setLoading] = useState(false);
  const {
    register,
    handleSubmit,
    formState: { errors },
    reset,
  } = useForm();

  const onSubmit = async (data) => {
    setLoading(true);
    await fetch(`${apiUrl}/outcomes/${outcomeData.id}`, {
      method: "PUT",
      headers: {
        "Content-type": "application/json",
        Accept: "application/json",
        Authorization: `Bearer ${token}`,
      },
      body: JSON.stringify(data),
    })
      .then((res) => res.json())
      .then((result) => {
        setLoading(false);
        if (result.status == 200) {
          const updatedOutcomes = outcomes.map((outcome) =>
            outcome.id == result.data.id
              ? { ...outcome, text: result.data.text }
              : outcome,
          );
          setOutcomes(updatedOutcomes);
          toast.success(result.message);
        } else {
          console.log("Something went wrong");
        }
      });
  };

  useEffect(() => {
    if (outcomeData) {
      reset({
        outcome: outcomeData.text,
      });
    }
  }, [outcomeData, reset]);

  return (
    <>
      <Modal size="lg" show={showOutcome} onHide={handleClose}>
        <form onSubmit={handleSubmit(onSubmit)}>
          <Modal.Header closeButton>
            <Modal.Title>{trans("updateOutcome.title")}</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <div className="mb-3">
              <label htmlFor="" className="form-label">
                {trans("updateOutcome.label")}
              </label>
              <input
                {...register("outcome", {
                  required: trans("updateOutcome.required"),
                })}
                type="text"
                className={`form-control ${errors.outcome && "is-invalid"}`}
                placeholder={trans("updateOutcome.placeholder")}
              />
              {errors.outcome && (
                <p className="invalid-feedback">{errors.outcome.message}</p>
              )}
            </div>
          </Modal.Body>
          <Modal.Footer>
            <button disabled={loading} className="btn btn-primary">
              {loading == false ? trans("common.save") : trans("common.pleaseWait")}
            </button>
          </Modal.Footer>
        </form>
      </Modal>
    </>
  );
};

export default UpdateOutcome;
