


import { createComment , postComment } from "../repositories/comments.repository.js";
import { findPostById } from "../repositories/posts.repository.js";




export async function singleComment (req, res) {

  const { comment } = req.body;
  const { id: userId } = res.locals.session;
  const { id: postId } = req.params;

  if (isNaN(postId))
  return res.sendStatus(401);

  try{

      const { rows:post } = await findPostById(postId);

      if (post.length === 0)
      return res.sendStatus(404);

      await createComment(userId, postId, comment);
      res.sendStatus(201);

  } catch (error) {

      console.log(error);
      res.status(500).send(error);

  }

}




export async function theComments (req, res) {

  const { id: userId } = res.locals.session;
  const { id: postId } = req.params;


  if (isNaN(postId))
  return res.sendStatus(401);


  try {

      const { rows: comment } = await postComment (userId, postId);
      res.status(200).send(comment);

  } catch (error) {


      console.log(error);
      res.status(500).send(error);


  }


}
