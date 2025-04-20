const { sequelize, DataTypes } = require('sequelize');
const dependent = require('../../models/benefits/dependent')(sequelize, DataTypes);

const index = (req, res) => {
    dependent.findAll({

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

    dependent.findByPk(id,{}).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}

const create = (req, res) => {

    //const id = req.params.id;

    console.log('create');
    console.log(req.body);

    dependent.create({

          employee_id: req.body.employee_id
        , dependent_type_id: req.body.dependent_type_id
        , dependent_status_id: req.body.dependent_status_id
        , first_name: req.body.first_name
        , middle_name: req.body.middle_name
        , last_name: req.body.last_name
        , dependent_dob: req.body.dependent_dob
        , dependent_active_date: req.body.dependent_active_date
        , dependent_inactive_date: req.body.dependent_inactive_date

    }).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}

const update = (req, res) => {

    const id = req.params.id;

    dependent.update({

          employee_id: req.body.employee_id
        , dependent_type_id: req.body.dependent_type_id
        , dependent_status_id: req.body.dependent_status_id
        , first_name: req.body.first_name
        , middle_name: req.body.middle_name
        , last_name: req.body.last_name
        , dependent_dob: req.body.dependent_dob
        , dependent_active_date: req.body.dependent_active_date
        , dependent_inactive_date: req.body.dependent_inactive_date

    },
    {
        where: {
            id: req.params.id
        }
    }


).then((result)=>{

        return res.json(result);

    }).catch((error)=>{

        console.log(error);
        return res.json({
            message: 'Unable to fetch records!'
        })

    })
}


module.exports = {
    index, show, create, update
}