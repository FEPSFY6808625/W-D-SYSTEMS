/**
 * Import the mysql package installed in the previous step.
 */
const mysql = require("mysql2");

/**
 * Import the util package. We use this to use async await with mysql.
 * Don't worry about this for now, just understand that we need it
 */
const util = require("util");
const express = require('express');
const ejs = require('ejs');
const bodyParser = require('body-parser');

const PORT = 8000;
const DB_HOST = 'localhost';
const DB_USER = 'root';
const DB_NAME = 'university_web';
const DB_PASSWORD = '22ENINuwcC';
const DB_PORT = 3306;

/**
 * set the connection parameters
 */
var connection = mysql.createConnection({
	host: DB_HOST,
	user: DB_USER,
	password: DB_PASSWORD,
	database: DB_NAME,
	port: DB_PORT,
  });
  
  /*
   * we do this to use async await with mysql
   * don't worry about this for now, just understand that we need it; otherwise * we end up with a lot of callback functions.
   * technically, we could import the mysql/promise package; however, this way allows for backwards compatibility.
   */
  connection.query = util.promisify(connection.query).bind(connection);
  
  /**
   * connect to the database.
   * If you see an error, check the database name, username, and password are correct. This probably because you are using your own MySql instance.
   */
  connection.connect(function (err) {
	if (err) {
	  console.error("error connecting: " + err.stack);
	  return;
	}
	console.log("Boom! You are connected");
  });
  

const app = express();

app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: false}));

app.get('/', async (req, res) => {
	const studentCount = await connection.query('SELECT COUNT(*) as count FROM Student');
	const academicCount = await connection.query('SELECT COUNT(*) as count FROM Academic');
	const departmentCount = await connection.query('SELECT COUNT(*) as count FROM Department');
	const courseCount = await connection.query('SELECT COUNT(*) as count FROM Course');

	res.render('index', {
		studentCount: studentCount[0].count,
		academicCount: academicCount[0].count,
		departmentCount: departmentCount[0].count,
		courseCount: courseCount[0].count
	});
});


app.get('/students', async (req, res) => {
	 /**
   * get all students from the database. we use an inner join to get the course name. don't display the course code, display the course name!
   */
	 const students = await connection.query("SELECT * FROM Student INNER JOIN Course  ON Student.Stu_Course = Course.Crs_Code");
	res.render('students', { students: students });
});


app.get('/students/view/:id', async (req, res) => {
	const student = await connection.query(
		"SELECT * FROM Student INNER JOIN Course  ON Student.Stu_Course = Course.Crs_Code WHERE URN = ?",
		[req.params.id]
	);
	res.render('student_view', { student: student[0] });
});

app.get('/students/edit/:id', async (req, res) => {
	const student = await connection.query("SELECT * FROM Student WHERE URN = ?",
		[req.params.id]
	);
	const courses = await connection.query("SELECT * FROM Course");
	res.render('student_edit', { student: student[0], courses: courses, message: '' });
});

app.post('/students/edit/:id', async (req, res) => {
	var message = "";
	if (isNaN(req.body.Stu_Phone) || req.body.Stu_Phone.length != 11) {
		message = "Please enter a valid phone number";
	} else {
		await connection.query("UPDATE Student SET ? WHERE URN = ?",
			[req.body, req.params.id,]);
		message = "Student updated";
	}
	const student = await connection.query("SELECT * FROM Student WHERE URN = ?",
		[req.params.id]);
	const courses = await connection.query("SELECT * FROM Course");
	res.render("student_edit", {student: student[0], courses: courses, message: message});
});


app.listen(PORT, () => {
	console.log(`Example app listening at http://localhost:${PORT}`);
});

