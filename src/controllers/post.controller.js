import urlMetadata from "url-metadata";
import { getPosts, insertHashtag, newPost } from "../repositories/posts.repository.js";
import {
  allHashtags,
  getSpecificHashtagDB,
  editPostDB,
  deletePostDB,
} from "../repositories/posts.repository.js";
import { theMetadata } from "../repositories/metadata.repository.js";
import { 
  like,
  dislike,
  findLike } from "../repositories/likes.repository.js";


export async function createPost(req, res) {
    const {link, description} = req.body
    const {userId} = res.locals.session
    try{
        const {rows: response} = await newPost(userId, link, description)
        const postId = response[0].id

        const metadata = urlMetadata(link).then((response) => {
            const { title, image, description} = response
            theMetadata(title, description, image, postId)
        })
        const hashtags = description.match(/#\w+/g)
        if (hashtags) {
          for (const hashtag of hashtags) {
            await insertHashtag(hashtag, postId)
          }
        }
        
        res.sendStatus(201)
    }catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getAllPosts(req, res) {
  try {
    const { rows: posts } = await getPosts();
    res.status(200).send(posts);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getHashtags(req, res) {
  try {
    const hashtags = await allHashtags();
    res.send(hashtags.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getSpecificHashtag(req, res) {
  const { hashtag } = req.params;
  try {
    const hashtags = await getSpecificHashtagDB(hashtag);
    if (hashtags.rows.length === 0)
      return res.status(404).send({ message: "Nenhuma hashtag encontrada" });
    res.send(hashtags.rows);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function editPost(req, res) {
  const { id } = req.params;
  const { description } = req.body;

  try {
    await editPostDB(id, description);
    res.sendStatus(200);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function deletePost(req, res) {
  const { id } = req.params;

  try {
    await deletePostDB(id);
    res.sendStatus(200);
  } catch (error) {
    res.status(500).send(error.message);
  }
}

export async function theLikes (req, res){

  const { postId, userId } = req.body
  
  const liked = await findLike (postId, userId)
  
  try {
  
   if(liked.rowCount===0){
  
    await like (postId, userId)
    res.sendStatus(200);
  
   } else {
  
    await dislike (postId, userId)
    res.sendStatus(200);
  
   }
  
   } catch(err){
  
    res.status(500).send(err.message)
  
   }
  
  }
  
