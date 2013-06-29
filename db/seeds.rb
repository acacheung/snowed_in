User.create(
  :email => 'pawpaw@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Paw Paw',
  :address => '230 Stuart Street Boston, MA',
  :old_or_disabled => 'true',
  :role => 'requester')

Request.create(
  :requester_id => 1,
  :job_size => 'big')

User.create(
  :email => 'daicomemou@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Dai Come Mou',
  :address => '743 Washington Street Boston, MA',
  :old_or_disabled => 'true',
  :role => 'requester')

Request.create(
  :requester_id => 2,
  :job_size => 'small')

User.create(
  :email => 'missma@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Miss Ma',
  :address => '557 Highland Avenue Needham, MA',
  :old_or_disabled => 'true',
  :role => 'requester')

Request.create(
  :requester_id => 3,
  :job_size => 'medium')

User.create(
  :email => 'old@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Gertrude',
  :address => '565 5th Avenue San Diego, CA',
  :old_or_disabled => 'true',
  :role => 'requester')

Request.create(
  :requester_id => 4,
  :job_size => 'small')



User.create(
  :email => 'johnny@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Johnny',
  :address => '30 Langley Road Newton, MA',
  :old_or_disabled => 'false',
  :role => 'requester')

Request.create(
  :requester_id => 5,
  :job_size => 'small',
  :offer => 20)

User.create(
  :email => 'comemou@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Come Mou',
  :address => '19 Hargrave Circle Newton, MA',
  :old_or_disabled => 'false',
  :role => 'requester')

Request.create(
  :requester_id => 6,
  :job_size => 'medium',
  :offer => 20)

User.create(
  :email => 'munbiujie@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Bernice',
  :address => '29 Boylston Street Newton, MA',
  :old_or_disabled => 'false',
  :role => 'requester')

Request.create(
  :requester_id => 7,
  :job_size => 'small',
  :offer => 10)

User.create(
  :email => 'jayes@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'James',
  :address => '1412 Beacon Street Brookline, MA',
  :old_or_disabled => 'false',
  :role => 'requester')

Request.create(
  :requester_id => 8,
  :job_size => 'medium',
  :offer => 20)

User.create(
  :email => 'tanny@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Tanny',
  :address => '140 Brandeis Road Newton, MA',
  :old_or_disabled => 'false',
  :role => 'requester')

Request.create(
  :requester_id => 9,
  :job_size => 'big',
  :offer => 50)

User.create(
  :email => 'briz@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Brianna Zeilinger',
  :address => '265 Langdon Street Madison, WI',
  :old_or_disabled => 'false',
  :role => 'requester')

Request.create(
  :requester_id => 10,
  :job_size => 'medium',
  :offer => 30)

User.create(
  :email => 'johnice@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Johnice Miller',
  :address => '5118 6th Avenue Kenosha, WI',
  :old_or_disabled => 'false',
  :role => 'requester')

Request.create(
  :requester_id => 11,
  :job_size => 'small',
  :offer => 10)

User.create(
  :email => 'mandalay@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Mandalay',
  :address => '3950 S Las Vegas Blvd Las Vegas, NV',
  :old_or_disabled => 'false',
  :role => 'requester')

Request.create(
  :requester_id => 12,
  :job_size => 'big',
  :offer => 30)



User.create(
  :email => 'amanda@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Amanda',
  :address => '21 Hargrave Circle Newton, MA',
  :role => 'shoveler')
