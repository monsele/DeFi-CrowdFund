export const contractAddress = {
  deployedTo:"0xDCba4aE68d171Dd53A27dee59479b47dB2d35c4b",
  transactionHash: "0x08f4f680af83f18820beb6934c7eb881010372a5a070d43bc3bc687f61e6eba5"
}

export const contractAbi=
[
	{
	  "inputs": [],
	  "stateMutability": "nonpayable",
	  "type": "constructor"
	},
	{
	  "inputs": [],
	  "name": "CampaingnNotFound",
	  "type": "error"
	},
	{
	  "inputs": [
		{
		  "internalType": "string",
		  "name": "name",
		  "type": "string"
		},
		{
		  "internalType": "string",
		  "name": "description",
		  "type": "string"
		},
		{
		  "internalType": "uint256",
		  "name": "amountRaised",
		  "type": "uint256"
		},
		{
		  "internalType": "uint256",
		  "name": "goal",
		  "type": "uint256"
		},
		{
		  "internalType": "address payable",
		  "name": "depositAddress",
		  "type": "address"
		}
	  ],
	  "name": "CreateCampaign",
	  "outputs": [
		{
		  "internalType": "bool",
		  "name": "",
		  "type": "bool"
		}
	  ],
	  "stateMutability": "nonpayable",
	  "type": "function"
	},
	{
	  "inputs": [],
	  "name": "Decimals_Exceeded",
	  "type": "error"
	},
	{
	  "inputs": [
		{
		  "internalType": "uint256",
		  "name": "id",
		  "type": "uint256"
		},
		{
		  "internalType": "uint256",
		  "name": "amt",
		  "type": "uint256"
		}
	  ],
	  "name": "fundCampaign",
	  "outputs": [
		{
		  "internalType": "bool",
		  "name": "",
		  "type": "bool"
		}
	  ],
	  "stateMutability": "payable",
	  "type": "function"
	},
	{
	  "inputs": [
		{
		  "internalType": "uint256",
		  "name": "id",
		  "type": "uint256"
		}
	  ],
	  "name": "fundContract",
	  "outputs": [],
	  "stateMutability": "payable",
	  "type": "function"
	},
	{
	  "inputs": [],
	  "name": "Insufficient_Balance",
	  "type": "error"
	},
	{
	  "inputs": [
		{
		  "internalType": "uint256",
		  "name": "id",
		  "type": "uint256"
		}
	  ],
	  "name": "payCampaign",
	  "outputs": [
		{
		  "internalType": "bool",
		  "name": "",
		  "type": "bool"
		}
	  ],
	  "stateMutability": "nonpayable",
	  "type": "function"
	},
	{
	  "anonymous": false,
	  "inputs": [
		{
		  "indexed": true,
		  "internalType": "address",
		  "name": "from",
		  "type": "address"
		},
		{
		  "indexed": true,
		  "internalType": "address",
		  "name": "to",
		  "type": "address"
		},
		{
		  "indexed": false,
		  "internalType": "uint256",
		  "name": "amount",
		  "type": "uint256"
		}
	  ],
	  "name": "Transfer",
	  "type": "event"
	},
	{
	  "anonymous": false,
	  "inputs": [
		{
		  "indexed": true,
		  "internalType": "address",
		  "name": "reciever",
		  "type": "address"
		},
		{
		  "indexed": false,
		  "internalType": "uint256",
		  "name": "amountPaid",
		  "type": "uint256"
		}
	  ],
	  "name": "paidCampaign",
	  "type": "event"
	},
	{
	  "inputs": [
		{
		  "internalType": "uint256",
		  "name": "",
		  "type": "uint256"
		}
	  ],
	  "name": "CampaingnList",
	  "outputs": [
		{
		  "internalType": "uint256",
		  "name": "Id",
		  "type": "uint256"
		},
		{
		  "internalType": "string",
		  "name": "Name",
		  "type": "string"
		},
		{
		  "internalType": "string",
		  "name": "Description",
		  "type": "string"
		},
		{
		  "internalType": "uint256",
		  "name": "AmountRaised",
		  "type": "uint256"
		},
		{
		  "internalType": "uint256",
		  "name": "Goal",
		  "type": "uint256"
		},
		{
		  "internalType": "address payable",
		  "name": "DepositAddress",
		  "type": "address"
		},
		{
		  "internalType": "bool",
		  "name": "Open",
		  "type": "bool"
		}
	  ],
	  "stateMutability": "view",
	  "type": "function"
	},
	{
	  "inputs": [
		{
		  "internalType": "uint256",
		  "name": "id",
		  "type": "uint256"
		}
	  ],
	  "name": "getCampaignDeposit",
	  "outputs": [
		{
		  "internalType": "uint256",
		  "name": "",
		  "type": "uint256"
		}
	  ],
	  "stateMutability": "view",
	  "type": "function"
	},
	{
	  "inputs": [],
	  "name": "GetCampaigns",
	  "outputs": [
		{
		  "components": [
			{
			  "internalType": "uint256",
			  "name": "Id",
			  "type": "uint256"
			},
			{
			  "internalType": "string",
			  "name": "Name",
			  "type": "string"
			},
			{
			  "internalType": "string",
			  "name": "Description",
			  "type": "string"
			},
			{
			  "internalType": "uint256",
			  "name": "AmountRaised",
			  "type": "uint256"
			},
			{
			  "internalType": "uint256",
			  "name": "Goal",
			  "type": "uint256"
			},
			{
			  "internalType": "address payable",
			  "name": "DepositAddress",
			  "type": "address"
			},
			{
			  "internalType": "bool",
			  "name": "Open",
			  "type": "bool"
			}
		  ],
		  "internalType": "struct CrowdFund.Campaingn[]",
		  "name": "",
		  "type": "tuple[]"
		}
	  ],
	  "stateMutability": "view",
	  "type": "function"
	},
	{
	  "inputs": [],
	  "name": "getContractBalance",
	  "outputs": [
		{
		  "internalType": "uint256",
		  "name": "",
		  "type": "uint256"
		}
	  ],
	  "stateMutability": "view",
	  "type": "function"
	},
	{
	  "inputs": [],
	  "name": "lastId",
	  "outputs": [
		{
		  "internalType": "uint256",
		  "name": "",
		  "type": "uint256"
		}
	  ],
	  "stateMutability": "view",
	  "type": "function"
	},
	{
	  "inputs": [],
	  "name": "owner",
	  "outputs": [
		{
		  "internalType": "address",
		  "name": "",
		  "type": "address"
		}
	  ],
	  "stateMutability": "view",
	  "type": "function"
	}
  ]