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


userRouter.post("/api/order", auth, async (req, res) => {
    try {
        const { name, description, fee, totalPrice, address } = req.body;

        let order = new Order({
            name,
            description,
            totalPrice,
            fee,
            address,
            userId: req.user,
            orderedAt: new Date().getTime(),
        });
        const savedOrder = await order.save();
        res.json(savedOrder);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});




userRouter.get("/api/orders/me", auth, async (req, res) => {
    try {
        const orders = await Order.find({ userId: req.user });
        console.log(req.user);

        res.json(orders);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = userRouter;