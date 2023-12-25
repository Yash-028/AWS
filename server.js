require('dotenv').config()
const app = require('./app.js')

const PORT = process.env.APP_PORT;

app.listen(PORT,()=>{
    console.log(`Started Listening on port ${PORT}`);
})
