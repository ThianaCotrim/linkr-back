import { db } from "../database/database.connection.js";

export function createSessionDB (userId, token) {

        return db.query(`INSERT INTO sessions ("userId", token) VALUES ($1, $2);`, [userId, token])
}