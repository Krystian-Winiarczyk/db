const express = require('express')
const router = express.Router()

// GET Sales Data
router.get('/:id', (req, res, next) => {
    const db = req.con

    const id = req.params.id

    const query = `
        SELECT 
          YEAR(p.created_at) AS year,
          MONTH(p.created_at) AS month,
          SUM(p.price) AS total_price FROM payments AS p 
        WHERE 
          p.cours_id IN (SELECT id FROM courses AS c WHERE c.teacher_id = '${id}')
        GROUP BY YEAR(p.created_at), MONTH(p.created_at);
    `
    db.query(query, (err, rows) => {
        res.send(rows)
    })
})

module.exports = router
