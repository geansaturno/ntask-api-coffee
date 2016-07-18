Sequelize = require "sequelize"
fs = require "fs"
path = require "path"

db = null

module.exports = (app)->

    if(!db)
        config = app.lib.config

        sequelize = new Sequelize(
            config.database,
            config.username,
            config.password,
            config.params
        )

        db = {
            Sequelize,
            sequelize,
            models: {}
        }

        dir = path.join __dirname, "models"

        fs.readdirSync(dir).forEach((file)->
            modelDir = path.join dir, file

            model = sequelize.import modelDir

            db.models[model.name] = model
        )

        Object.keys(db.models).forEach((key)->
            db.models[key].associate(db.models)
        )

    return db
