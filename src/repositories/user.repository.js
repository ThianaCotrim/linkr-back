import { db } from "../database/database.connection.js";

export function getUserByEmailDB(email) {
  return db.query(`SELECT * FROM users WHERE email=$1;`, [email]);
}

export function creatUserDB(email, password, name, profileImage) {
  return db.query(
    `INSERT INTO users (email, password, name, "profileImage") VALUES ($1, $2, $3, $4);`,
    [email, password, name, profileImage]
  );
}

export async function getUserByIdDB(id) {
  const result = await db.query(`SELECT * FROM users WHERE id=$1;`, [id]);
  return result.rows[0];
}

export async function getUserPostsDB(userId) {
  const result = await db.query(`SELECT * FROM posts WHERE "userId"=$1;`, [userId]);
  return result.rows;
}

export function searchUsersDB(name) {
  return db.query(`SELECT * FROM users WHERE name ILIKE $1;`, [`%${name}%`]);
}
