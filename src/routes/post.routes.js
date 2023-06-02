
import {Router} from 'express'
import { tokenValidation } from '../middlewares/tokenValidation.js'
import { validateSchema } from '../middlewares/validateSchema.js'
import { postBodySchema } from '../schemas/postSchema.js'
import {
  createPost,
  getAllPosts,
  getHashtags,
  getSpecificHashtag,
  editPost,
  deletePost,
} from "../controllers/post.controller.js";
import { EditPostValidation } from "../middlewares/post.middleware.js";


const postRouter = Router();


postRouter.post("/posts", tokenValidation, validateSchema(postBodySchema),createPost)
postRouter.get("/posts", tokenValidation, getAllPosts)

postRouter.post("/posts", tokenValidation, createPost);
postRouter.get("/posts", tokenValidation, getAllPosts);
postRouter.get("/hashtag", tokenValidation, getHashtags);
postRouter.get("hashtag/:hashtag", tokenValidation, getSpecificHashtag);
postRouter.put(
  "/posts/:id",
  validateSchema(postBodySchema),
  tokenValidation,
  EditPostValidation,
  editPost
);
postRouter.delete("/posts/:id", tokenValidation, deletePost);


export default postRouter;
