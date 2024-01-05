import { TableComponent } from "../components/table.js";
import React, { useEffect,useState } from "react";
import Web3 from "web3";

import {contractAbi,contractAddress} from '../abi/CrowdFund.js'

export default function CampaignList() {
  const [dataCamp, setdataCamp] = useState([]);

  useEffect(() => {
    async function connectAndGetBalance() {
      try {
        const web3 = new Web3(window.ethereum);
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        var contract =new web3.eth.Contract(contractAbi,contractAddress.deployedTo);
      
        var camps = await contract.methods.GetCampaigns().call();
        let setUp=[];
          var check = camps.find(x=>x.Id===Number(camps[0].Id))
          console.log(check);
        camps.forEach(function (value, i) {
          setUp.push({id:i,name:value.Name,description:value.Description,goal:Number(value.Goal)})
      });
       // console.log(camps);
        await setdataCamp(setUp);
      } catch (error) {
        console.error('Error connecting or fetching balance:', error);
      }
    }
    connectAndGetBalance();
  }, [])
  return <TableComponent data={dataCamp} />;
  
}
