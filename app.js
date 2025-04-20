///////////////////////////////////////////////
////            delclarations
///////////////////////////////////////////////

var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const methodOverride = require('method-override');

const { Pool } = require('pg');

///////////////////////////////////////////////
///          benefits routers
///////////////////////////////////////////////

// employee tables
const employeeRouter = require('./routes/benefits/employee');
const employeeDeptRouter = require('./routes/benefits/employeedept');
const employeePositionRouter = require('./routes/benefits/employeeposition');
const employeeRelationshipStatusRouter = require('./routes/benefits/employeerelationshipstatus');
const employeeStatusRouter = require('./routes/benefits/employeestatus');
const positionAndDeptsRouter = require('./routes/benefits/positionanddepts');

//dependent tables
const dependentRouter = require('./routes/benefits/dependent');
const dependentTypeRouter = require('./routes/benefits/dependenttype');
const dependentStatusRouter = require('./routes/benefits/dependentstatus');

//enrollment period and benefits tables
const enrollmentPeriodRouter = require('./routes/benefits/enrollmentperiod');
const benefitPlanRouter = require('./routes/benefits/benefitplan');
const benefitPlanTypeRouter = require('./routes/benefits/benefitplantype');
const benefitPlanLevelRouter = require('./routes/benefits/benefitplanlevel');

//enrollment period, benefit plan level selected
const employeeEnrollmentTypeRouter = require('./routes/benefits/employeeenrollmenttype');
const employeeEnrollmentRouter = require('./routes/benefits/employeeenrollment');
const benefitPlanLevelSelectedRouter = require('./routes/benefits/benefitplanlevelselected');

//ee enrollment life event + life event tables
const lifeEventEnrollmentRelationshipRouter = require('./routes/benefits/lifeeventenrollmentrelationship');
const lifeEventTypeRouter = require('./routes/benefits/lifeeventtype');
const lifeEventRouter = require('./routes/benefits/lifeevent');
const lifeEventDependentRouter = require('./routes/benefits/lifeeventdependent');

///////////////////////////////////////////////
////            setup
///////////////////////////////////////////////
var app = express();
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(methodOverride('_method'));

const pool = new Pool({
  user: 'webapp',
  host: 'localhost',
  database: 'enrollments',
  password: 'BlueSushi123@',
  port: 5432,
});

///////////////////////////////////////////////
///           cors
///////////////////////////////////////////////
const cors=require('cors');
const corsOptions={
    origin: '*'
  , credentials: true
  , optionsSuccessStatus:200
}
app.use(cors(corsOptions)) //use this after the variable declaration

app.get('/records', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM employee');
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

///////////////////////////////////////////////
///           benefits routes
///////////////////////////////////////////////

//employee tables
app.use('/employee', employeeRouter);
app.use('/employeedept', employeeDeptRouter);
app.use('/employeeposition', employeePositionRouter);
app.use('/employeerelationshipstatus', employeeRelationshipStatusRouter);
app.use('/employeestatus', employeeStatusRouter);
app.use('/positionanddepts', positionAndDeptsRouter);

//dependent tables
app.use('/dependent', dependentRouter);
app.use('/dependenttype', dependentTypeRouter);
app.use('/dependentstatus', dependentStatusRouter);

//enrollment period and benefits tables
app.use('/enrollmentperiod', enrollmentPeriodRouter);
app.use('/benefitplan', benefitPlanRouter);
app.use('/benefitplantype', benefitPlanTypeRouter);
app.use('/benefitplanlevel', benefitPlanLevelRouter);

//enrollment period, benefit plan level selected
app.use('/employeeenrollmenttype', employeeEnrollmentTypeRouter);
app.use('/employeeenrollment', employeeEnrollmentRouter);
app.use('/benefitplanlevelselected', benefitPlanLevelSelectedRouter);

//ee enrollment life event + life event tables
app.use('/lifeeventenrollmentrelationship', lifeEventEnrollmentRelationshipRouter);
app.use('/lifeeventtype', lifeEventTypeRouter);
app.use('/lifeevent', lifeEventRouter);
app.use('/lifeeventdependent', lifeEventDependentRouter);

///////////////////////////////////////////////
///           error handling
///////////////////////////////////////////////

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  //res.render('error');
});

module.exports = app;
