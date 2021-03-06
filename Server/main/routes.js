/** @format */

var express = require("express");
var router = express.Router();
var pool = require("./db");

// let team_lead_id = pool.query('teams table');
// let slackHandle = pool.query('SELECT slackHandle FROM Users WHERE id=$1', [team_lead_id])

// var i =0;
// var team="";

// looping through the recordset {

// if(i==0){
//    Display the name of the Equalithon
// }

// if(team != row->teamid){
//    <div>Display team<div>
// }

//  team = row->team
//  i++;
// }

// select userid from users where first_name='Beyonce';

// -- get the userid ---

// Decide what to do,

// select * from equalithons where endDate>now()

// --search equalithon

// select * from equalithons where equalithon_name='Women Day';
// -- get the ids of the equalithons

// select * from teams where team.equalithonid=[id]

// get all teams???

// post - create a team
// INSERT INTO teams()

// //get all equalithons history for one user
// SELECT equalithons.equalithon_name, user_equalithons.team_id, users.first_name
// FROM teams
// INNER JOIN equalithons ON teams.equalithon_id=equalithons.equalithon_id
// INNER JOIN user_equalithons ON user_equalithons.team_id=teams.team_id
// INNER JOIN users ON users.uid=user_equalithons.user_id
// WHERE user_id=$1

/*
  USER PROFILE SECTION
*/

//User initial sign up
// router.post("/api/signup", (req, res, next) => {
// 	const values = [
// 		req.body.first_name,
// 		req.body.last_name,
// 		req.body.email,
// 		req.body.pwd,
// 	];
// 	try {
// 		let newUser = pool.query(
// 			`INSERT INTO users(first_name, last_name, email, pwd)
//               VALUES($1, $2, $3, $4)`,
// 			values
// 		);
// 		res.json(newUser);
// 	} catch (err) {
// 		next(err);
// 	}
// });

// //User registration after signing up for an equalithon
// router.put("/api/registration", (req, res, next) => {
// 	const values = [
// 		req.body.slack_handle,
// 		req.body.reason_for_joining,
// 		req.body.country,
// 		req.body.region,
// 		req.body.city,
// 		req.body.post_code,
// 		req.body.linkedIn,
// 		req.body.job_title,
// 		req.body.main_speciality,
// 		req.body.experience,
// 		req.body.last_company,
// 		req.body.num_employees,
// 		req.body.sector,
// 		req.body.user_type,
// 		req.body.uid,
// 	];

// 	try {
// 		let updateUser = pool.query(
// 			`UPDATE users SET slack_handle=$1,reason_for_joining=$2,country=$3,region=$4,city=$5,post_code=$6,linkedIn=$7,job_title=$8,main_speciality=$9,experience=$10,last_company=$11,num_employees=$12,sector=$13,user_type=$14 WHERE uid=$15`,
// 			values
// 		);
// 		res.json(updateUser);
// 	} catch (err) {
// 		next(err);
// 	}
// });


// /*
//   EQUALITHON SECTION
// */

// //get all equalithons
// router.get("/api/equalithons", (req, res, next) => {
// 	pool.query(`SELECT * FROM equalithons ORDER BY startdate DESC`, (
//     (q_err, q_res) => {
// 			if (q_err) {
//         next(q_err)
// 			}
// 			res.json(q_res.rows);
// 		}
//   ));
// });

// /*
//   CHALLENGES SECTION
// */

// //get all challenges
// router.get("/api/challenges/:id", (req, res, next) => {
// 	const equalithonID = req.params.id
// 	pool.query(`SELECT * FROM challenges WHERE equalithon_id=${equalithonID}`, (
//     (q_err, q_res) => {
// 			if (q_err) {
//         next(q_err)
// 			}
// 			res.json(q_res.rows);
// 		}
//   ));
// });

// /*
//   USER EQUALITHONS HISTORY SECTION
// */

// //User joins a new Equalithon, Challenege, and Team
// router.post("/api/user_equalithons", (req, res, next) => {
// 	const values = [
// 		req.body.user_id,
// 		req.body.equalithon_id,
// 		req.body.team_id,
// 		req.body.current,
// 	];
// 	try {
// 		let newUserEqualithon = pool.query(
// 			`INSERT INTO user_equalithons(user_id, equalithon_id, team_id, current)
//               VALUES($1, $2, $3, $4)`,
// 			values
// 		);
// 		res.json(newUserEqualithon);
// 	} catch (err) {
// 		next(err);
// 	}
// });




//------------------------------------------------------------------------------------------------------------
//OLD STUFF




/*
    POSTS ROUTES SECTION
*/

router.get('/api/get/allposts', (req, res, next ) => {
  pool.query("SELECT * FROM posts ORDER BY date_created DESC", (q_err, q_res) => {
      res.json(q_res.rows)
  })
})

router.get('/api/get/post', (req, res, next) => {
  const post_id = req.query.post_id

  pool.query(`SELECT * FROM posts
              WHERE pid=$1`, [ post_id ],
              (q_err, q_res) => {
                res.json(q_res.rows)
      })
} )


// router.post('/api/post/posttodb', (req, res, next) => {
//   const values = [req.body.title, req.body.body, req.body.uid, req.body.username]
//   pool.query(`INSERT INTO posts(title, body, user_id, author, date_created)
//               VALUES($1, $2, $3, $4, NOW() )`, values, (q_err, q_res) => {
//           if(q_err) return next(q_err);
//           res.json(q_res.rows)
//     })
// })

router.put('/api/put/post', (req, res, next) => {
  const values = [req.body.title, req.body.body, req.body.uid, req.body.pid, req.body.username]
  pool.query(`UPDATE posts SET title= $1, body=$2, user_id=$3, author=$5, date_created=NOW()
              WHERE pid = $4`, values,
              (q_err, q_res) => {
                console.log(q_res)
                console.log(q_err)
        })
})

router.delete('/api/delete/postcomments', (req, res, next) => {
  const post_id = req.body.post_id
  pool.query(`DELETE FROM comments
              WHERE post_id = $1`, [post_id],
              (q_err, q_res) => {
                  res.json(q_res.rows)
                  console.log(q_err)
        })
})

router.delete('/api/delete/post', (req, res, next) => {
  const post_id = req.body.post_id
  pool.query(`DELETE FROM posts WHERE pid = $1`, [ post_id ],
              (q_err, q_res) => {
                res.json(q_res.rows)
                console.log(q_err)
       })
})

/*
    COMMENTS ROUTES SECTION
*/


router.post('/api/post/commenttodb', (req, res, next) => {
  const values = [ req.body.comment, req.body.user_id, req.body.username, req.body.post_id]

  pool.query(`INSERT INTO comments(comment, user_id, author, post_id, date_created)
              VALUES($1, $2, $3, $4, NOW())`, values,
              (q_err, q_res ) => {
                  res.json(q_res.rows)
                  console.log(q_err)
      })
})

router.put('/api/put/commenttodb', (req, res, next) => {
  const values = [ req.body.comment, req.body.user_id, req.body.post_id, req.body.username, req.body.cid]

  pool.query(`UPDATE comments SET
              comment = $1, user_id = $2, post_id = $3, author = $4, date_created=NOW()
              WHERE cid=$5`, values,
              (q_err, q_res ) => {
                  res.json(q_res.rows)
                  console.log(q_err)
      })
})


router.delete('/api/delete/comment', (req, res, next) => {
  const cid = req.body.comment_id
  console.log(cid)
  pool.query(`DELETE FROM comments
              WHERE cid=$1`, [ cid ],
              (q_err, q_res ) => {
                  res.json(q_res)
                  console.log(q_err)
      })
})


router.get('/api/get/allpostcomments', (req, res, next) => {
  const post_id = String(req.query.post_id)
  pool.query(`SELECT * FROM comments
              WHERE post_id=$1`, [ post_id ],
              (q_err, q_res ) => {
                  res.json(q_res.rows)
      })
})

/*
  USER PROFILE SECTION
*/

router.post('/api/posts/userprofiletodb', (req, res, next) => {
  const values = [req.body.profile.nickname, req.body.profile.email, req.body.profile.email_verified]
  pool.query(`INSERT INTO users(username, email, email_verified, date_created)
              VALUES($1, $2, $3, NOW())
              ON CONFLICT DO NOTHING`, values,
              (q_err, q_res) => {
                res.json(q_res.rows)
      })
} )

router.get('/api/get/userprofilefromdb', (req, res, next) => {
  const email = req.query.email
  console.log(email)
  pool.query(`SELECT * FROM users
              WHERE email=$1`, [ email ],
              (q_err, q_res) => {
                res.json(q_res.rows)
      })
} )

router.get('/api/get/userposts', (req, res, next) => {
  const user_id = req.query.user_id
  console.log(user_id)
  pool.query(`SELECT * FROM posts
              WHERE user_id=$1`, [ user_id ],
              (q_err, q_res) => {
                res.json(q_res.rows)
      })
} )


router.put('/api/put/likes', (req, res, next) => {
  const uid = [req.body.uid]
  const post_id = String(req.body.post_id)

  const values = [ uid, post_id ]
  console.log(values)
  pool.query(`UPDATE posts
              SET like_user_id = like_user_id || $1, likes = likes + 1
              WHERE NOT (like_user_id @> $1)
              AND pid = ($2)`,
     values, (q_err, q_res) => {
    if (q_err) return next(q_err);
    console.log(q_res)
    res.json(q_res.rows);
  });
});


//Search Posts
router.get('/api/get/searchpost', (req, res, next) => {
  search_query = String(req.query.search_query)
  pool.query(`SELECT * FROM posts
              WHERE search_vector @@ to_tsquery($1)`,
    [ search_query ], (q_err, q_res) => {
    if (q_err) return next(q_err);
    res.json(q_res.rows);
  });
});

//Save posts to db
router.post('/api/post/posttodb', (req, res, next) => {
  const body_vector = String(req.body.body)
  const title_vector = String(req.body.title)
  const username_vector = String(req.body.username)

  const search_vector = [title_vector, body_vector, username_vector]
  const values = [req.body.title, req.body.body, search_vector, req.body.uid, req.body.username]
  pool.query(`INSERT INTO
              posts(title, body, search_vector, user_id, author, date_created)
              VALUES($1, $2, to_tsvector($3), $4, $5, NOW())`,
    values, (q_err, q_res) => {
    if (q_err) return next(q_err);
    res.json(q_res.rows);
  });
});


/* Retrieve another users profile from db based on username */
router.get('/api/get/otheruserprofilefromdb', (req, res, next) => {
  // const email = [ "%" + req.query.email + "%"]
  const username = String(req.query.username)
  pool.query(`SELECT * FROM users
              WHERE username = $1`,
    [ username ], (q_err, q_res) => {
    res.json(q_res.rows)
  });
});

//Get another user's posts based on username
router.get('/api/get/otheruserposts', (req, res, next) => {
  const username = String(req.query.username)
  pool.query(`SELECT * FROM posts
              WHERE author = $1`,
    [ username ], (q_err, q_res) => {
    res.json(q_res.rows)
  });
});

//Send Message to db
router.post('/api/post/messagetodb', (req, res, next) => {

  const from_username = String(req.body.message_sender)
  const to_username = String(req.body.message_to)
  const title = String(req.body.title)
  const body = String(req.body.body)

  const values = [from_username, to_username, title, body]
  pool.query(`INSERT INTO messages(message_sender, message_to, message_title, message_body, date_created)
              VALUES($1, $2, $3, $4, NOW())`,
    values, (q_err, q_res) => {
    if (q_err) return next(q_err);
    console.log(q_res)
    res.json(q_res.rows);
  });
});

//Get another user's posts based on username
router.get('/api/get/usermessages', (req, res, next) => {
  const username = String(req.query.username)
  console.log(username)
  pool.query(`SELECT * FROM messages
              WHERE message_to = $1`,
    [ username ], (q_err, q_res) => {
    res.json(q_res.rows)
  });
});

//Delete a message with the message id
router.delete('/api/delete/usermessage', (req, res, next) => {
  const mid = req.body.mid
  pool.query(`DELETE FROM messages
              WHERE mid = $1`,
    [ mid ], (q_err, q_res) => {
    if (q_err) return next(q_err);
    console.log(q_res)
    res.json(q_res.rows);
  });
});


module.exports = router
