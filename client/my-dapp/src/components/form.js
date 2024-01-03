import React from 'react';
import '../App.css';
export const CampaignForm = ({ campaign, onSendFunds }) => {
  return (
    <div>
      <h2>Campaign Information</h2>
      <p>Name: {campaign.name}</p>
      <p>Description: {campaign.description}</p>
      <p>Goal: {campaign.goal}</p>

      <form onSubmit={onSendFunds}>
        <label htmlFor="funds">Send Funds:</label>
        <input type="number" id="funds" name="funds" />
        <button type="submit">Send</button>
      </form>
    </div>
  );
};

export default CampaignForm;
