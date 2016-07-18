module.exports = (sequelize, type)->
    Tasks = sequelize.define("tasks",
        {
            id:
                primaryKey: true
                autoIncrement: true
                type: type.INTEGER

            name:
                type: type.STRING
                allowNull: false,
                validate:
                    notEmpty: true
        }, {
            classMethods:
                associate: (model)->
                    Tasks.belongsTo(model.users)
            tableName: "coffee_tasks"
        }
    )

    Tasks
