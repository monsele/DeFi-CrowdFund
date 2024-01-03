import React from "react";
import "../App.css";
export const ResponseComponent = ({ message }) => {
  return (
    <div className="success-container">
      <h2 className="success-message">Success!</h2>
      <p>{message}</p>
      {/* Add additional content or actions as needed, e.g., a button to return to the previous page */}
    </div>
  );
};
