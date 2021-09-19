const express = require('express')
const router = express.Router()

// GET All Notifications
router.get('/:id', (req, res, next) => {
    const db = req.con

    const id = req.params.id

    const query = `
        SELECT 
          n.*, 
          u.name AS teacher_name, u.avatar, u.id AS teacher_id,
          c.name, c.image, c.price
        FROM notifications AS n 
          LEFT JOIN users AS u ON n.user_id = u.id
          LEFT JOIN courses AS c ON c.id = n.cours_id
        WHERE 
          n.notification_for = '${id}'
    `
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

// GET New Notifications
router.get('/new/:id', (req, res, next) => {
    const db = req.con

    const id = req.params.id

    const query = `
        SELECT 
          n.*, 
          u.name AS teacher_name, u.avatar, u.id AS teacher_id,
          c.name, c.image, c.price
        FROM notifications AS n 
          LEFT JOIN users AS u ON n.user_id = u.id
          LEFT JOIN courses AS c ON c.id = n.cours_id
        WHERE 
          n.notification_for = '${id}' AND
          n.created_at >= NOW() - INTERVAL 1 DAY AND
          n.readed = 0
    `
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

// POST New Notifications
router.post('/read/:id', (req, res, next) => {
    const db = req.con

    const id = req.params.id

    const query = `UPDATE notifications AS n SET readed = 1 WHERE n.id = '${id}'`
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

//

module.exports = router
