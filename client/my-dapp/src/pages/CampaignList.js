import { TableComponent } from "../components/table.js";
import React, { useEffect,useState } from "react";
import Web3 from "web3";
import { ethers } from "ethers";
import {contractAbi,contractAddress} from '../abi/CrowdFund.js'

export default function CampaignList() {
  const [dataCamp, setdataCamp] = useState([])
  const myData = [
    { id: 1, name: "Item 1", description: "Description of item 1" },
    { id: 2, name: "Item 2", description: "Description of item 2" },
    { id: 3, name: "Item 3", description: "Description of item 3" },
  ];

  useEffect(() => {
    async function connectAndGetBalance() {
      try {
        const web3 = new Web3(window.ethereum);
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        var contract =new web3.eth.Contract(contractAbi,contractAddress.deployedTo);
      
        var camps = await contract.methods.GetCampaigns().call();
        let setUp=[];
        // camps.forEach(element => {
        //   setUp.push({id:1,name:element.Name});
        // });

        camps.forEach(function (value, i) {
          setUp.push({id:i,name:value.Name,description:value.Description,goal:Number(value.Goal)})
      });
        //console.log(setUp);
        await setdataCamp(setUp)
        console.log(dataCamp);
      } catch (error) {
        console.error('Error connecting or fetching balance:', error);
      }
    }
    connectAndGetBalance();
  }, [])
  return <TableComponent data={dataCamp} />;
  
}
