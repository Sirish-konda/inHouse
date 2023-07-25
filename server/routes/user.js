const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const User = require("../models/user");
const Order = require("../models/order");
const { Worker } = require("../models/worker")

// save user address
userRouter.post("/api/save-user-address", auth, async (req, res) => {
    try {
        const { address } = req.body;
        let user = await User.findById(req.user);
        user.address = address;
        user = await user.save();
        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// order product
userRouter.post("/api/order", auth, async (req, res) => {
    try {
        const { workerD, totalPrice, address } = req.body;
        let workers = [];

        for (let i = 0; i < workerD.length; i++) {
            let product = await Worker.findById(workerD[i].product._id);
            if (product.quantity >= workerD[i].quantity) {
                product.quantity -= workerD[i].quantity;
                workers.push({ product, quantity: cartD[i].quantity });
                await product.save();
            } else {
                return res
                    .status(400)
                    .json({ msg: `${product.name} is out of stock!` });
            }
        }

        let user = await User.findById(req.user);
        user.cart = [];
        user = await user.save();

        let order = new Order({
            products,
            totalPrice,
            address,
            userId: req.user,
            orderedAt: new Date().getTime(),
        });
        order = await order.save();
        res.json(order);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

userRouter.get("/api/orders/me", auth, async (req, res) => {
    try {
        const orders = await Order.find({ userId: req.user });
        res.json(orders);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = userRouter;