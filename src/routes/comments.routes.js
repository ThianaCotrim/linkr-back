
import { Router } from "express";
import { singleComment , theComments } from "../repositories/comments.repository.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { tokenValidation } from "../middlewares/tokenValidation.js";
import commentsSchema from "../schemas/comments.schema.js";


const commentsRouter = Router();


commentsRouter.post('/posts/:id/comments', tokenValidation, validateSchema(commentsSchema), singleComment);
commentsRouter.get(`/posts/:id/comments`, tokenValidation, theComments);


export default commentsRouter;