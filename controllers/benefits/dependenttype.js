const { sequelize, DataTypes } = require('sequelize');
const dependenttype = require('../../models/benefits/dependenttype')(sequelize, DataTypes);


const index = (req, res) => {
    
    dependenttype.findAll({

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