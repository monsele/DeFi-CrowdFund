import { CampaignForm } from "../components/form";
import React, { useEffect,useState } from "react";
import Web3 from "web3";
import { useNavigate } from "react-router-dom";
import { useParams } from "react-router-dom";
import {contractAbi,contractAddress} from '../abi/CrowdFund.js'
export default function FundCampaign() {
  const { id } = useParams();
  const [myCamp, setmyCamp] = useState({})
  useEffect(() => {
    async function getCamp() {
      try {
        const web3 = new Web3(window.ethereum);
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        var contract =new web3.eth.Contract(contractAbi,contractAddress.deployedTo);
        var camps = await contract.methods.GetCampaigns().call();
        var check = camps.find(x=>x.Id==Number(camps[0].Id))
        let setUp={
          Id:check.Id,
          name:check.Name,
          description:check.Description,
          goal:Number(check.Goal)
        }
        
       console.log(setUp);
       setmyCamp(setUp);
      } catch (error) {
        console.error('Error connecting or fetching balance:', error);
      }
    }
    getCamp();
  }, [])
  let navigate = useNavigate();

  const handleSendFunds = async (event) => {
    event.preventDefault();
    try {
      const web3 = new Web3(window.ethereum);
      var contract =new web3.eth.Contract(contractAbi,contractAddress.deployedTo);
      const accounts = await web3.eth.getAccounts(); // Get user's MetaMask account
      const transaction = contract.methods.fundContract(id);
      web3.eth.estimateGas();
      const options = {
        from: accounts[0], // Specify sender address
        value: web3.utils.toWei("0.01", "ether"), // Example ETH amount to send
      };
      const transactionReceipt = await transaction.send(options);
      console.log("Transaction hash:", transactionReceipt.transactionHash);
      console.log("Transaction details:", transactionReceipt);
      navigate("/success");
    } catch (error) {
      console.error("Error calling payable function:", error);
    }

  };
  return <CampaignForm campaign={myCamp} onSendFunds={handleSendFunds} />;
}
