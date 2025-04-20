const { sequelize, DataTypes } = require('sequelize');
const lifeevent = require('../../models/benefits/lifeevent')(sequelize, DataTypes);

const index = (req, res) => {
 
    lifeevent.findAll({

    }).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}

const show = (req, res) => {

    const id = req.params.id;

    lifeevent.findByPk(id,{}).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}

const create = (req, res) => {

    console.log('create');
    console.log(req.body);

    lifeevent.create({

          employee_id: req.body.employee_id
        , life_event_type_id: req.body.life_event_type_id
        , dependent_id: req.body.dependent_id
        , life_event_date: req.body.life_event_date
        , datetime_created: req.body.datetime_created

    }).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}

module.exports = {
    index, show, create
}