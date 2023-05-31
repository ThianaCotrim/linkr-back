export function EditPostValidation(req, res, next) {
  const { link, description } = req.body;

  if (!link || !description) {
    return res.status(400).send("Nenhum campo pode ficar vazio!");
  }

  next();
}