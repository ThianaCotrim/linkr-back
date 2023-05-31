import { db } from "../database/database.connection.js";
export function newPost (userId, link, description) {
    return db.query(`INSERT INTO posts ("userId", link, description) VALUES ($1, $2, $3) RETURNING id;`, [userId, link, description])
};
export function getPosts(id,page) {
    const offset = (page - 1) * 20;
    return db.query(`SELECT p.*, u.name AS "username", u."profileImage" AS "image", 
    m.title AS "metatitle”, m.description AS “metadescript”, m.image AS “metaimage”, u.id = $1 AS “owner”
    FROM posts p
    JOIN users u ON u.id = p."userId"
    JOIN metadata m ON m."postId" = p.id
    GROUP BY p.id, u.id, p.description, p.link, u.name, u."profileImage", m.title, m.description, m.image
    ORDER BY p."createdAt" DESC LIMIT 20 OFFSET $2`,
    [id,offset]);
    }
export function findPostById (id) {
    return db.query(`SELECT * FROM posts WHERE id = $1`, [id]);

};