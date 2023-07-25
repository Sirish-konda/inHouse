const mongoose = require('mongoose');
const ratingSchema = require('./rating');

const workerSchema = mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true,
    },
    description: {
        type: String,
        required: true,
        trim: true,
    },
    fee: {
        type: Number,
        required: true,

    },
    profilePicture: {
        type: String,
        required: true,
    },
    gender: {
        type: String,
        required: true,
    },
    ratings: [ratingSchema],

});

const Worker = mongoose.model("Worker", workerSchema);
module.exports = { Worker, workerSchema };