const express = require("express")

const app = express();
const postsRoute = require("./api/models/user.router")

app.use(express.json())
app.use('/',postsRoute);

module.exports = app;