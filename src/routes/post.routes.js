import {Router} from 'express'
import { tokenValidation } from '../middlewares/tokenValidation.js'
import { createPost, getAllPosts } from '../controllers/post.controller.js'

const postRouter = Router()

postRouter.post("/posts", tokenValidation, createPost)
postRouter.get("/posts", tokenValidation, getAllPosts)

export default postRouter 