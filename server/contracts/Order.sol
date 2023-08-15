// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Product.sol";

contract OrderContract {
    enum OrderStatus { Pending, Shipped, Delivered }

    struct Order {
        uint256 orderId;
        address customer;
        uint256 productId; // Reference to the product being ordered
        uint256 quantity;
        OrderStatus status;
    }

    mapping(uint256 => Order) public orders;
    uint256 public orderCount;

    ProductContract public productContract; // Reference to the ProductContract

    constructor(address _productContract) {
        productContract = ProductContract(_productContract);
    }

    event OrderPlaced(uint256 indexed orderId, address indexed customer, uint256 productId, uint256 quantity);
    event OrderStatusUpdated(uint256 indexed orderId, OrderStatus status);

    function placeOrder(uint256 _productId, uint256 _quantity) external {
        require(productContract.isProductAvailable(_productId), "Product not available");
        
        orderCount++;
        orders[orderCount] = Order(orderCount, msg.sender, _productId, _quantity, OrderStatus.Pending);
        emit OrderPlaced(orderCount, msg.sender, _productId, _quantity);
    }

    function updateOrderStatus(uint256 _orderId, OrderStatus _status) external {
        require(_orderId > 0 && _orderId <= orderCount, "Invalid order ID");
        orders[_orderId].status = _status;
        emit OrderStatusUpdated(_orderId, _status);
    }
}
