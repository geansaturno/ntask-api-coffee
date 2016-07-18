module.exports = (sequelize, DataType)->

    Users = sequelize.define("users", {

        id:
            type: DataType.INTEGER
            autoIncrement: true
            primaryKey: true

        name:
            type: DataType.STRING
            allowNull: true
            validate:
                notEmpty: true
    }, {

        classMethods:
            associate: (models)->
                Users.hasMany(models.tasks)

        tableName: "coffee_users"
    })

    Users
