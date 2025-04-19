const { sequelize, DataTypes } = require('sequelize');
const lifeevent = require('../../models/benefits/lifeevent')(sequelize, DataTypes);

const index = (req, res) => {
 
    lifeevent.findAll({

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