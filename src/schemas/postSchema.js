import joi from 'joi'

export const postBodySchema = joi.object({
    link: joi.string().uri().required(),
    description: joi.string(),
})