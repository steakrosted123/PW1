// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductContract {
    struct Product {
        uint256 productId;
        address farmer;
        string name;
        string description;
        uint256 price;
        uint256 availableQuantity;
    }

    mapping(uint256 => Product) public products;
    uint256 public productCount;

    event ProductListed(uint256 indexed productId, address indexed farmer, string name, string description, uint256 price, uint256 availableQuantity);

    function listProduct(string memory _name, string memory _description, uint256 _price, uint256 _availableQuantity) external {
        productCount++;
        products[productCount] = Product(productCount, msg.sender, _name, _description, _price, _availableQuantity);
        emit ProductListed(productCount, msg.sender, _name, _description, _price, _availableQuantity);
    }
    function isProductAvailable(uint256 _productId) external view returns (bool) {
        return _productId > 0 && _productId <= productCount && products[_productId].availableQuantity > 0;
    }

}
