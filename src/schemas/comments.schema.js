
import joi from 'joi';

const commentsSchema = joi.object({


  comment: joi.string().min(1).max(150).required()

 });

export default commentsSchema;