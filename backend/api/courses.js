const express = require('express')
const router = express.Router()

// GET All
router.get('/', (req, res, next) => {
    const db = req.con

    const query = `
        SELECT c.*, u.name as teacher_name, u.avatar, u.email, COUNT(co.id) as comments_count
        FROM courses AS c 
        LEFT JOIN users AS u ON u.id = c.teacher_id
        LEFT JOIN comments AS co ON co.cours_id = c.id
        GROUP BY c.id
    `
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

// GET Created
router.get('/created-courses/:id', (req, res, next) => {
    const db = req.con
    const teacherId = req.params.id

    const query = `SELECT * FROM courses AS c WHERE c.teacher_id = '${teacherId}'`
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

// GET Owned
router.get('/my-courses/:id', (req, res, next) => {
    const db = req.con
    const userId = req.params.id

    const query = `SELECT * FROM 'user_courses' AS uc WHERE 'uc'.user_id = '${userId}'`
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

// POST Buy Cours
router.post('/buy', (req, res, next) => {
    const db = req.con
    const data = req.body

    console.log(data)

    res.send()
})


module.exports = router
