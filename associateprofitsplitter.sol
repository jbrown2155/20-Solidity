pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value/3;

        // @TODO: Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        msg.sender.transfer(msg.value-amount*3);
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        deposit();
    }
}

// 1 - 0x04E0dcDA26463097a58E9549D6BB5c14F3294Aa2
// 2 - 0x2e48de9d510a74e749900535df5c9b7eaac416e3
// 3 - 0x2e48de9d510a74e749900535df5c9b7eaac416e3
// Contract - 0xCAF2Eae006aD5BD97409095Ff67f71c95510a155
// tx - 0x61b3452af8b91cb624a4ee101c0a115ff3696c80d8dcb7e8bdafee30335d54f9