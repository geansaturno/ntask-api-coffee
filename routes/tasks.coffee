module.exports = (app)->

    Tasks = app.db.models.tasks

    app.route "/tasks"
    .get((req, res) ->
        console.log "Parametros da requisicão:", req.params

        Tasks.findAll({})
        .then((results)->
            res.json(results)
        )
        .catch((error)->
            res.status(412).json msg: error.message
        )
    )
    .post((req, res)->
        console.log "Corpo da requisição:", req.body

        Tasks.create(req.body)
        .then((result)-> res.json result)
        .catch((error)-> res.status(412).json error: error.message)
    )
