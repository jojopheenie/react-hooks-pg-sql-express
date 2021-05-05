const { Pool } = require('pg')

const pool = new Pool({
  user: 'josephineamos',
  host: 'localhost',
  database: 'reactHooks',
  password: '',
  post: 5432
})

module.exports = pool
