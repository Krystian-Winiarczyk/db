const express = require('express')
const router = express.Router()

// POST Auth / login
router.post('/login', (req, res, next) => {
    const db = req.con

    const { email, password } = req.body

    const query = `
        SELECT * FROM users AS u WHERE u.email = '${email}' AND u.password = '${password}'
    `
    db.query(query, (err, rows) => {
        if (rows.length) {
            res.send(rows)
        } else {
            res.status(400).send('Something broke!')
        }
    })
})

//

module.exports = router
