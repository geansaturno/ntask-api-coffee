module.exports = (app)->

    console.log "models:", app.db.models

    app.db.sequelize.sync(force: true).done(()->
        app.listen(app.get("port"), ()->
            console.log "Server iniciado na porta " + app.get "port"
        )
    )
