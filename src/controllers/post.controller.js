export async function createPost(req, res) {
    try{
        res.sendStatus(200)
    }catch (err) {
        res.status(500).send(err.message)
    }
}

export async function getAllPosts(req, res) {
    try{
        res.sendStatus(200)
    }catch (err) {
        res.status(500).send(err.message)
    }
}