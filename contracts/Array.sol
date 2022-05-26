// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Array {
    uint[] public arr;
    uint[] public arr2 = [1,2,3];

    uint[10] public myFixedSizeArr;

    function get(uint i) public view returns (uint) {
        return arr[i];
    }

    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        delete arr[index];
    } 

    function examples() external {
        uint[] memory a = new uint[](5);
    }
}

contract ArrayRemoveByShifting {
    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "index out of length.");

        for (uint i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i+1];
        }
        
        arr.pop();
    }

    function test() external {
        arr = [1,2,3,4,5];
        remove(2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        arr = [1];
        remove(0);
        assert(arr.length == 0);
    }
}