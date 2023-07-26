const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const { Worker } = require('../models/worker');
const Order = require('../models/order');

adminRouter.post('/admin/add-worker', admin, async (req, res) => {
    try {
        const { name, description, fee, gender, profilePicture, } = req.body;
        let worker = new Worker({
            name,
            description,
            fee,
            gender,
            profilePicture,
        });
        worker = await worker.save();
        res.json(worker);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

//get data of workers
adminRouter.get("/admin/get-workers", admin, async (req, res) => {
    try {
        const workers = await Worker.find({});
        res.json(workers);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// Delete the product
adminRouter.post("/admin/delete-worker", admin, async (req, res) => {
    try {
        const { id } = req.body;
        let worker = await Worker.findByIdAndDelete(id);
        res.json(worker);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


//

adminRouter.get('/admin/get-orders', admin, async (req, res) => {
    try {
        const orders = await Order.find({});
        res.json(orders);
        console.log(orders);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
})


//
adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
    try {
        const { id, status } = req.body;
        let order = await Order.findById(id);
        order.status = status;
        order = await order.save();
        res.json(order);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = adminRouter;