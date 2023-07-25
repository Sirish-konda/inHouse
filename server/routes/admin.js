const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const { Worker } = require('../models/worker');

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


module.exports = adminRouter;