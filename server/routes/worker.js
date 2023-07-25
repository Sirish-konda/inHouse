const express = require("express");
const workerRouter = express.Router();
const auth = require("../middlewares/auth");
const { Worker } = require('../models/worker');


workerRouter.get("/api/workers", auth, async (req, res) => {
    try {
        const workers = await Worker.find({});
        res.json(workers);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

//creating a get request to search workers.



workerRouter.get("/api/workers/search/:name", auth, async (req, res) => {
    try {
        const workers = await Worker.find({
            name: { $regex: req.params.name, $options: "i" },
        });

        res.json(workers);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


//post request route to rate the product
workerRouter.post("/api/rate-worker", auth, async (req, res) => {
    try {
        const { id, rating } = req.body;
        let worker = await Worker.findById(id);

        for (let i = 0; i < worker.ratings.length; i++) {
            if (worker.ratings[i].userId == req.user) {
                worker.ratings.splice(i, 1);
                break;
            }
        }

        const ratingSchema = {
            userId: req.user,
            rating,
        };

        worker.ratings.push(ratingSchema);
        worker = await worker.save();
        res.json(worker);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});


module.exports = workerRouter;