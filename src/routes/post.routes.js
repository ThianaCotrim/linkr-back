import {Router} from 'express'
import { tokenValidation } from '../middlewares/tokenValidation.js'
import { createPost, getAllPosts } from '../controllers/post.controller.js'
import { validateSchema } from '../middlewares/validateSchema.js'
import { postBodySchema } from '../schemas/postSchema.js'

const postRouter = Router()

postRouter.post("/posts", tokenValidation, validateSchema(postBodySchema),createPost)
postRouter.get("/posts", tokenValidation, getAllPosts)

export default postRouter 