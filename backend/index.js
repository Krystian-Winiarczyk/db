const express = require('express')
const mysql = require('mysql')
const bodyParser = require('body-parser')
const cors = require('cors')

// Api points
const courses = require('./api/courses.js')
const filler = require('./filler.js')
const auth = require('./api/auth.js')
const notifications = require('./api/notifications.js')
const sales = require('./api/sales.js')
const users = require('./api/users.js')

// Sql connection
const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'zaliczenie'
})

con.connect(err => {
    if(err){
        console.log('Error connecting to database')
        return
    }
    console.log('Connected successfully')
});

const app = express()

app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }));

app.use((req,res,next) => {
    req.con = con;
    next();
});

app.use('/api/courses', courses)
app.use('/api/notifications', notifications)
app.use('/api/fill', filler)
app.use('/api/auth', auth)
app.use('/api/sales', sales)
app.use('/api/users', users)

app.listen(8082, () => console.log('Server started at port: 8082'))
