const { sequelize, DataTypes } = require('sequelize');
const employeeenrollment = require('../../models/benefits/employeeenrollment')(sequelize, DataTypes);

const index = (req, res) => {
 
    employeeenrollment.findAll({

    }).then((result)=>{

        console.log('success');
        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}

module.exports = {
    index
}