import {CampaignForm} from '../components/form'
import React from 'react'
import  {useNavigate}  from "react-router-dom";

export default function FundCampaign() {
  let navigate = useNavigate();
  const handleSendFunds = (event) => {
    event.preventDefault(); // Prevent default form submission
    // Implement logic to send funds here, using values from the form
    navigate("/success");
    
  };
  const myCampaign = { name: 'Campaign A', description: 'Description of Campaign A', goal: 100 };
  return (
    <CampaignForm campaign={myCampaign} onSendFunds={handleSendFunds} />
  )
}




