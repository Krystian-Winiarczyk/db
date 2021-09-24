const express = require('express')
const router = express.Router()

// GET Users
router.get('/:id', (req, res, next) => {
    const db = req.con
    const { userId } = req.params.id

    const query = `
        SELECT * FROM users AS u WHERE u.id != '${userId}'
    `
    db.query(query, (err, rows) => {
        if (rows.length) {
            res.send(rows)
        } else {
            res.status(400).send('Something broke!')
        }
    })
})

// POST Follow User
router.post('/:id', (req, res, next) => {
    const db = req.con
    const { currentUser, userId } = req.body

    const query = `
        INSERT INTO followed_users (followed_user_id, follower_user_id) VALUES (${userId}, ${currentUser})
    `
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

module.exports = router
