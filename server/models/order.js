const mongoose = require("mongoose");
const { workerSchema } = require("./worker");

const orderSchema = mongoose.Schema({
    workers: [
        {
            product: workerSchema,
            quantity: {
                type: Number,
                required: true,
            },
        },
    ],
    totalPrice: {
        type: Number,
        required: true,
    },
    address: {
        type: String,
        required: true,
    },
    userId: {
        required: true,
        type: String,
    },
    orderedAt: {
        type: Number,
        required: true,
    },
    status: {
        type: Number,
        default: 0,
    },
});

const Order = mongoose.model("Order", orderSchema);
module.exports = Order;