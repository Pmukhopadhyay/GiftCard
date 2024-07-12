// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract GiftCard{
    uint public id;
    string public name;
    string public description;
    uint256 public constant DECIMAL = 1e18;
    uint private priceInCents;

    // takes a value _id and assigns it to the state variable id
    function setId(uint _id) public {
          id = _id;
    }

    // returns the value of the state variable id
    function getId() public view returns  (uint) {
        return id;
    }

    // takes a value _name and assigns it to the state variable name
    function setName(string memory _name) public {
          name = _name;
    }

    // returns the value of the state variable name
    function getName() public view returns  (string memory) {
        return name;
    }

    // takes a value _description and assigns it to the state variable description
    function setDescription(string memory _description) public {
          description = _description;
    }

    // returns the value of the state variable description
    function getDescription() public view returns  (string memory) {
        return description;
    }

     // Setter function to set the price of the item in cents
    function setPrice(uint _priceInCents) public {
        priceInCents = _priceInCents;
    }

    // Getter function to retrieve the price of the item in cents
    function getPrice() public view returns (uint) {
        return priceInCents;
    }

    // Helper function to get the price in a formatted string with two decimals
    function getPriceFormatted() public view returns (string memory) {
        uint dollars = priceInCents / 100;
        uint cents = priceInCents % 100;
        return string(abi.encodePacked(uintToStr(dollars), ".", cents < 10 ? "0" : "", uintToStr(cents)));
    }

    // Internal helper function to convert uint to string
    function uintToStr(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }  

}
