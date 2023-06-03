import { Router } from "express";
import { tokenValidation } from "../middlewares/tokenValidation.js";
import {
	createPost,
	getAllPosts,
	getHashtags,
	getSpecificHashtag,
} from "../controllers/post.controller.js";

const postRouter = Router();

postRouter.post("/posts", tokenValidation, createPost);
postRouter.get("/posts", tokenValidation, getAllPosts);
postRouter.get("/hashtag", getHashtags);
postRouter.get("/hashtag/:hashtag", getSpecificHashtag);

export default postRouter;
