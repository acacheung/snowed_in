User.create(
  :email => 'pawpaw@test.com',
  :password => '1234qwer',
  :password_confirmation => '1234qwer',
  :name => 'Paw Paw',
  :street => '230 Stuart Street',
  :city => 'Boston',
  :state => 'MA',
  :zipcode => '02116',
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
  :street => '743 Washington Street',
  :city => 'Boston',
  :state => 'MA',
  :zipcode => '02135',
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
  :street => '557 Highland Avenue',
  :city => 'Needham',
  :state => 'MA',
  :zipcode => '02494',
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
  :street => '565 5th Avenue',
  :city => 'San Diego',
  :state => 'CA',
  :zipcode => '92101',
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
  :street => '30 Langley Road',
  :city => 'Newton',
  :state => 'MA',
  :zipcode => '02459',
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
  :street => '19 Hargrave Circle',
  :city => 'Newton',
  :state => 'MA',
  :zipcode => '02461',
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
  :street => '29 Boylston Street',
  :city => 'Newton',
  :state => 'MA',
  :zipcode => '02467',
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
  :street => '1412 Beacon Street',
  :city => 'Brookline',
  :state => 'MA',
  :zipcode => '02446',
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
  :street => '140 Brandeis Road',
  :city => 'Newton',
  :state => 'MA',
  :zipcode => '02459',
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
  :street => '265 Langdon Street',
  :city => 'Madison',
  :state => 'WI',
  :zipcode => '53703',
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
  :street => '5118 6th Avenue',
  :city => 'Kenosha',
  :state => 'WI',
  :zipcode => '53140',
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
  :street => '3950 S Las Vegas Blvd',
  :city => 'Las Vegas',
  :state => 'NV',
  :zipcode => '89119',
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
  :city => 'Newton',
  :state => 'MA',
  :zipcode => '02461',
  :role => 'shoveler')
