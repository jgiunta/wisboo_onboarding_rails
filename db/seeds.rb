# Admin user
User.create(
  role: 'admin',
  name: 'Jose',
  last_name: 'Diaz',
  email: 'admin@email.com',
  password: 'password')
# Basic users
User.create(
  role: 'basic',
  name: 'Valentina',
  last_name: 'Maldonado',
  email: 'valentina@email.com',
  password: 'password')
User.create(
  role: 'basic',
  name: 'Ruben',
  last_name: 'Bello',
  email: 'ruben@email.com',
  password: 'password')
User.create(
  role: 'basic',
  name: 'Fede',
  last_name: 'Dibenedetto',
  email: 'fede@email.com',
  password: 'password')