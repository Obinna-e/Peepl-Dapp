import 'dart:js';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web3/ethers.dart';



final humanReadableAbi = [
  "function createVestingSchedule(address _beneficiary, uint256 _start, uint256 _cliff, uint256 _duration, uint256 _slicePeriodSeconds, bool _revocable, uint256 _amount)", "constructor(address token_)", "event OwnershipTransferred(address indexed previousOwner, address indexed newOwner)", "function release(bytes32 vestingScheduleId, uint256 amount)", "event Released(uint256 amount)", "function renounceOwnership()", "function revoke(bytes32 vestingScheduleId)", "event Revoked()", "function transferOwnership(address newOwner)", "function withdraw(uint256 amount)", "function computeNextVestingScheduleIdForHolder(address holder) view returns (bytes32)", "function computeReleasableAmount(bytes32 vestingScheduleId) view returns (uint256)", "function computeVestingScheduleIdForAddressAndIndex(address holder, uint256 index) pure returns (bytes32)", "function getLastVestingScheduleForHolder(address holder) view returns (tuple(bool initialized, address beneficiary, uint256 cliff, uint256 start, uint256 duration, uint256 slicePeriodSeconds, bool revocable, uint256 amountTotal, uint256 released, bool revoked))", "function getToken() view returns (address)", "function getVestingIdAtIndex(uint256 index) view returns (bytes32)", "function getVestingSchedule(bytes32 vestingScheduleId) view returns (tuple(bool initialized, address beneficiary, uint256 cliff, uint256 start, uint256 duration, uint256 slicePeriodSeconds, bool revocable, uint256 amountTotal, uint256 released, bool revoked))", "function getVestingScheduleByAddressAndIndex(address holder, uint256 index) view returns (tuple(bool initialized, address beneficiary, uint256 cliff, uint256 start, uint256 duration, uint256 slicePeriodSeconds, bool revocable, uint256 amountTotal, uint256 released, bool revoked))", "function getVestingSchedulesCount() view returns (uint256)", "function getVestingSchedulesCountByBeneficiary(address _beneficiary) view returns (uint256)", "function getVestingSchedulesTotalAmount() view returns (uint256)", "function getWithdrawableAmount() view returns (uint256)", "function owner() view returns (address)"

];

final jsonAbi = '''[
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_beneficiary",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "_start",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_cliff",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_duration",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_slicePeriodSeconds",
				"type": "uint256"
			},
			{
				"internalType": "bool",
				"name": "_revocable",
				"type": "bool"
			},
			{
				"internalType": "uint256",
				"name": "_amount",
				"type": "uint256"
			}
		],
		"name": "createVestingSchedule",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "token_",
				"type": "address"
			}
		],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "OwnershipTransferred",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "vestingScheduleId",
				"type": "bytes32"
			},
			{
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "release",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "Released",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "renounceOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "vestingScheduleId",
				"type": "bytes32"
			}
		],
		"name": "revoke",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [],
		"name": "Revoked",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "transferOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"stateMutability": "payable",
		"type": "fallback"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "withdraw",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"stateMutability": "payable",
		"type": "receive"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "holder",
				"type": "address"
			}
		],
		"name": "computeNextVestingScheduleIdForHolder",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "vestingScheduleId",
				"type": "bytes32"
			}
		],
		"name": "computeReleasableAmount",
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
		"inputs": [
			{
				"internalType": "address",
				"name": "holder",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "index",
				"type": "uint256"
			}
		],
		"name": "computeVestingScheduleIdForAddressAndIndex",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"stateMutability": "pure",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "holder",
				"type": "address"
			}
		],
		"name": "getLastVestingScheduleForHolder",
		"outputs": [
			{
				"components": [
					{
						"internalType": "bool",
						"name": "initialized",
						"type": "bool"
					},
					{
						"internalType": "address",
						"name": "beneficiary",
						"type": "address"
					},
					{
						"internalType": "uint256",
						"name": "cliff",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "start",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "duration",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "slicePeriodSeconds",
						"type": "uint256"
					},
					{
						"internalType": "bool",
						"name": "revocable",
						"type": "bool"
					},
					{
						"internalType": "uint256",
						"name": "amountTotal",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "released",
						"type": "uint256"
					},
					{
						"internalType": "bool",
						"name": "revoked",
						"type": "bool"
					}
				],
				"internalType": "struct TokenVesting.VestingSchedule",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getToken",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "index",
				"type": "uint256"
			}
		],
		"name": "getVestingIdAtIndex",
		"outputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "vestingScheduleId",
				"type": "bytes32"
			}
		],
		"name": "getVestingSchedule",
		"outputs": [
			{
				"components": [
					{
						"internalType": "bool",
						"name": "initialized",
						"type": "bool"
					},
					{
						"internalType": "address",
						"name": "beneficiary",
						"type": "address"
					},
					{
						"internalType": "uint256",
						"name": "cliff",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "start",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "duration",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "slicePeriodSeconds",
						"type": "uint256"
					},
					{
						"internalType": "bool",
						"name": "revocable",
						"type": "bool"
					},
					{
						"internalType": "uint256",
						"name": "amountTotal",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "released",
						"type": "uint256"
					},
					{
						"internalType": "bool",
						"name": "revoked",
						"type": "bool"
					}
				],
				"internalType": "struct TokenVesting.VestingSchedule",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "holder",
				"type": "address"
			},
			{
				"internalType": "uint256",
				"name": "index",
				"type": "uint256"
			}
		],
		"name": "getVestingScheduleByAddressAndIndex",
		"outputs": [
			{
				"components": [
					{
						"internalType": "bool",
						"name": "initialized",
						"type": "bool"
					},
					{
						"internalType": "address",
						"name": "beneficiary",
						"type": "address"
					},
					{
						"internalType": "uint256",
						"name": "cliff",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "start",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "duration",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "slicePeriodSeconds",
						"type": "uint256"
					},
					{
						"internalType": "bool",
						"name": "revocable",
						"type": "bool"
					},
					{
						"internalType": "uint256",
						"name": "amountTotal",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "released",
						"type": "uint256"
					},
					{
						"internalType": "bool",
						"name": "revoked",
						"type": "bool"
					}
				],
				"internalType": "struct TokenVesting.VestingSchedule",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getVestingSchedulesCount",
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
		"inputs": [
			{
				"internalType": "address",
				"name": "_beneficiary",
				"type": "address"
			}
		],
		"name": "getVestingSchedulesCountByBeneficiary",
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
		"name": "getVestingSchedulesTotalAmount",
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
		"name": "getWithdrawableAmount",
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
]''';

// Contruct Interface object out of `humanReadableAbi` or `jsonAbi`
final humanInterface = Interface(humanReadableAbi);
final jsonInterface = Interface(jsonAbi);

// These two abi interface can be exchanged
final min = humanInterface.format(FormatTypes.minimal); // [function balanceOf(address) view returns (uint256)]

bool isTrue = humanInterface.format(FormatTypes.minimal)[0] == jsonInterface.format(FormatTypes.minimal)[0]; // true

showTrue () {
  print(isTrue);
  print(jsonInterface.format(FormatTypes.minimal));
}





