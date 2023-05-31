import { db } from "../database/database.connection.js";

export function theMetadata(title, description, image, postId) {
    return db.query('INSERT INTO metadata (title, image , description, "postId") VALUES ($1, $2, $3, $4)', [title, description, image, postId])
}