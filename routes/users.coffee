module.exports = (app)->

    users = app.db.models.users

    app.route("/users")
    .get((req, res)->
        users.findAll({})
        .then((result) -> res.json(result))
        .catch((error)-> res.status(412).json(msg: error.message))
    )
    .post((req, res)->
        users.create(req.body)
        .then((result)-> res.json(result))
        .catch((error)-> res.status(412).json(msg: error.message))
    )

    app.route("/users/:id")
    .get((req,res)->
        users.findOne(where: req.params)
        .then((result)-> res.json(result))
        .catch((error)-> res.status(412).json(msg: error.message))
    )
    .put((req, res) ->
        users.update(req.body, where: req.params)
        .then(()-> res.sendStatus 200)
        .catch((error)-> res.status(412).json(msg: error.message))
    )
    .delete((req, res)->
        users.destroy(where: req.params)
        .then(()->res.sendStatus 200)
        .catch((error)-> res.status(412).json(msg: error.message))
    )
