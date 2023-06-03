
export function findLike(postId, userId){

  return db.query(`SELECT * FROM likes WHERE "postId"=$1 AND "userId"=$2`, [postId, userId])

}


export function like (postId, userId){

  return db.query(` INSERT INTO likes ("postId", "userId") VALUES ($1, $2)`, [postId, userId])

}


export function dislike (postId, userId){

  return db.query(` DELETE FROM likes WHERE "postId"=$1 AND "userId"=$2`, [postId, userId])

}
