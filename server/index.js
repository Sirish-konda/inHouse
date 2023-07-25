//imports from packages
const express = require('express');
const mongoose = require('mongoose');


//imports from other files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const workerRouter = require('./routes/worker');
const userRouter = require("./routes/user");


//INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://merohandler44:Andrew@cluster0.8stekqv.mongodb.net/?retryWrites=true&w=majority";

//MiddleWare (CLIENT -> SERVER -> CLIENT)
app.use(express.json());

app.use(authRouter);

app.use(adminRouter);

app.use(workerRouter);

app.use(userRouter);




//Connections
mongoose.connect(DB).then(() => {
    console.log('connection succesful');
}).catch(e => {
    console.log(e);
});

//GET, PUT, POST, DELETE, UPDATE

//http://<youripaddress>/hello-wprld


app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at the port ${PORT}`);
});

