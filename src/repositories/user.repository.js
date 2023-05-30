import { db } from "../database/database.connection.js"

export function getUserByEmailDB (email) {
    return db.query(`SELECT * FROM users WHERE email=$1;`, [email])
}

export function creatUserDB (email, password, name, profileImage){
    return db.query(`INSERT INTO users (email, password, name, "profileImage") VALUES ($1, $2, $3, $4);`,
    [email, password, name, profileImage])
}