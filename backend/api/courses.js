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

// GET Owned
router.get('/owned/:id', (req, res, next) => {
    const db = req.con
    const userId = req.params.id

    const query = `
        SELECT uc.user_id, c.*, r.starts, r.id AS rating_id, COUNT(co.id) as comments_count
        FROM user_courses AS uc 
        LEFT JOIN courses AS c ON uc.cours_id = c.id
        LEFT JOIN comments AS co ON co.cours_id = uc.cours_id
        LEFT JOIN ratings AS r ON uc.cours_id = r.cours_id AND uc.user_id = r.user_id
        WHERE uc.user_id = '${userId}'
        GROUP BY uc.id
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
    const { cardNumber, cardOwner, cardTerm, CardCvv, currentUser, price, id, } = req.body

    const query = `INSERT INTO payments(user_id, cours_id, price, card_num, card_cvv, card_owner, card_term) VALUES ('${currentUser}', '${id}', ${price}, '${cardNumber}', '${CardCvv}', '${cardOwner}', '${cardTerm}')`
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

// POST Update Stars
router.post('/rate', (req, res, next) => {
    const db = req.con
    const { coursId, userId, stars, ratingId  } = req.body
    const query = `
        INSERT INTO ratings (id, cours_id, user_id, starts) VALUES(${ratingId}, ${coursId}, ${userId}, ${stars}) ON DUPLICATE KEY UPDATE starts = ${stars}
    `
    db.query(query, (err, rows) => {
        console.log(err, rows)
        res.send(rows)
    })
})

module.exports = router
