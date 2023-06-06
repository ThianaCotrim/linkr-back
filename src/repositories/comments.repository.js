
import { db } from "../database/database.connection.js";



export async function createComment(userId, postId, comment) {


  return await db.query('INSERT INTO comments ("userId", "postId", comment) VALUES ($1, $2, $3);', [userId, postId, comment]);


}



export async function postComment(userId, postId) {

  return await db.query(`SELECT c."userId", u.name AS name, u."profileImage" AS image,
      c.comment, p."userId" = c."userId" AS owner , f.id IS NOT NULL AS following
      FROM comments c
      JOIN users u ON c."userId" = u.id
      JOIN posts p ON c."postId" = p.id
      LEFT JOIN following f ON f."userId" = $1 and f."followingId" = c."userId"
      WHERE c."postId" = $2
     ORDER BY c.id ASC;`, [userId, postId]);

}
