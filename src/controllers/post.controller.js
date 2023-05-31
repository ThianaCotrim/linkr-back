import {
  allHashtags,
  getSpecificHashtagDB,
  editPostDB,
  deletePostDB,
} from "../repositories/posts.repository.js";

export async function createPost(req, res) {
  try {
    res.sendStatus(200);
  } catch (err) {
    res.status(500).send(err.message);
  }
}

export async function getAllPosts(req, res) {
  try {
    res.sendStatus(200);
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
  const { link, description } = req.body;

  try {
    await editPostDB(id, link, description);
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
