import { db } from "../database/database.connection.js";

export function getPosts() {
  return db.query(`
    SELECT p.*, u.name AS username, u."profileImage" AS image, 
        m.title AS metatitle, m.description AS metadescript, m.image AS metaimage, u.id AS owner
        FROM posts p
        JOIN users u ON u.id = p."userId"
        JOIN metadata m ON m."postId" = p.id
        GROUP BY p.id, u.id, p.description, p.link, u.name, u."profileImage", m.title, m.description, m.image
        ORDER BY p."createdAt" DESC LIMIT 20
        ;`);
}

export function newPost(userId, link, description) {
  return db.query(
    'INSERT INTO posts ("userId", link, description) VALUES ($1, $2, $3) RETURNING id',
    [userId, link, description]
  );
}

export function findPostById(id) {
  return db.query("SELECT * FROM posts WHERE id = $1", [id]);
}

export async function allHashtags() {
	try {
		const result = await db.query(
			`SELECT DISTINCT hashtag FROM hashtags LIMIT 10`
		);
		return result;
	} catch (err) {
		return err.message;
	}
}

export async function getSpecificHashtagDB(hashtag) {

	try {
		const result = await db.query(
			`SELECT p.*, u.name, u."profileImage"
			FROM posts p
			JOIN hashtags h ON p.id = h."postId"
			JOIN users u ON p."userId" = u.id
			WHERE h.hashtag = $1`,
			[hashtag]
		);
		return result;
	} catch (err) {
		return err.message;
	}
}

export function editPostDB(id, description) {
  return db.query(
    `UPDATE posts
        SET description = $1
        WHERE id = $2
        RETURNING *`,
    [description, id]
  );
}

export function deletePostDB(id) {
  return db.query(
    `DELETE FROM posts
        WHERE id = $1
        RETURNING *`,
    [id]
  );
}
