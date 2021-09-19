const express = require('express')
const router = express.Router()
const faker = require('faker')

// GET All
router.get('/', (req, res, next) => {
    const db = req.con

    // Init location
    // for (let i = 0; i < 20; i++) {
    //     const query = `INSERT INTO location (street, city, country) VALUES ('${faker.address.streetName()}', '${faker.address.city()}', '${faker.address.country()}')`
    //     db.query(query, (err, rows) => {
    //         console.log('location added', err)
    //     })
    // }

    // Init users
    // for (let i = 0; i < 10; i++) {
    //     const query = `INSERT INTO users (name, phone, email, password, location_id, role, avatar) VALUES (
    //         '${faker.name.findName()}', '${faker.phone.phoneNumber()}', '${faker.internet.email()}', '${faker.internet.password()}', '${i + 1}', '${i % 3 ? "S" : "T"}', '${faker.image.avatar()}'
    //     )`
    //     db.query(query, (err, rows) => {
    //         console.log('location added', err)
    //     })
    // }

    // Init courses
    db.query('SELECT id FROM users WHERE role = "T"', (err, rows) => {
        const techerIds = rows.map(row => row.id)

        for (let i = 0; i < 10; i++) {
            const num = Math.floor(Math.random() * techerIds.length)
            const randomTeacherId = techerIds[num]
            const query = `INSERT INTO courses (name, description, price, image, rating, teacher_id) VALUES (
                '${faker.lorem.sentence()}', '${faker.lorem.text()}', '${faker.commerce.price()}', '${faker.image.cats()}' ,0 , '${randomTeacherId}'
            )`
            db.query(query, (err, rows) => {
                console.log('location added', err)
            })
        }
    })

    res.send(`
        '${faker.lorem.sentence()}', '${faker.lorem.text()}', '${faker.commerce.price()}', '${faker.image.cats()}' ,0 , 'id'
    `)
})

module.exports = router
