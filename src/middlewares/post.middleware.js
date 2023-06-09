export function EditPostValidation(req, res, next) {
  const { description } = req.body;

  if (!description) {
    return res.status(400).send("Nenhum campo pode ficar vazio!");
  }

  next();
}